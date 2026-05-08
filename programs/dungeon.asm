; dungeon.asm -- Procedural Dungeon Crawler with Fog of War
; BSP room generation, L-shaped corridors, radius-based visibility
; Controls: W/A/S/D = move, R = regenerate dungeon
;
; 32x32 tile map, 8x8 pixel tiles = 256x256 screen
;
; Memory map:
;   0x2000-0x23FF  Tiles (1024: 0=wall, 1=floor)
;   0x3000-0x33FF  Visibility (1024: 0=hidden, 1=explored, 2=visible)
;   0x4000        player_x
;   0x4001        player_y
;   0x4100-0x4103  Room 0 (x, y, w, h)
;   0x4110-0x4113  Room 1 (x, y, w, h)
;   0x4120-0x4123  Room 2 (x, y, w, h)
;   0x4130-0x4133  Room 3 (x, y, w, h)
;   0x6000-0x6005  Color LUT (6 entries)
;
; Register Convention
; r1  = temp (reusable)
; r4  = 1 (constant)
; r5  = 5 (for SHL multiply by 32)
; r6  = 0x2000 (map base)
; r7  = 0x3000 (vis base)
; r8  = player_x
; r9  = player_y
; r10-r25 = temps for subroutines
; r30 = SP, r31 = LR

; === ENTRY ===
restart:
    LDI r30, 0xFE00
    LDI r4, 1
    LDI r5, 5
    LDI r6, 0x2000
    LDI r7, 0x3000

    PUSH r31
    CALL init_colors
    POP r31
    PUSH r31
    CALL init_dungeon
    POP r31
    JMP game_loop

; === COLOR TABLE ===
; Index = vis*3 + tile_type (0=wall, 1=floor)
; Wall:  0=hidden(0x0C0C18) 1=explored(0x2A2A44) 2=visible(0x5566AA)
; Floor: 3=hidden(0x0C0C18) 4=explored(0x1E1E36) 5=visible(0x8888CC)
init_colors:
    LDI r20, 0x6000
    LDI r1, 0x0C0C18
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 0x2A2A44
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 0x5566AA
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 0x0C0C18
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 0x1E1E36
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 0x8888CC
    STORE r20, r1
    RET

; === DUNGEON INITIALIZATION ===
; BSP split: divide 32x32 into 4 quadrants with random split point
; Place random room in each quadrant, connect with corridors
init_dungeon:
    ; Clear tile map (1024 words of 0)
    LDI r20, 0x2000
    LDI r21, 0x2400
    LDI r1, 0
clr_tiles:
    CMP r20, r21
    BGE r0, clr_vis
    STORE r20, r1
    ADDI r20, 1
    JMP clr_tiles

clr_vis:
    ; Clear visibility map (1024 words of 0)
    LDI r20, 0x3000
    LDI r21, 0x3400
clr_v:
    CMP r20, r21
    BGE r0, bsp_start
    STORE r20, r1
    ADDI r20, 1
    JMP clr_v

bsp_start:
    ; BSP split: horizontal at y=10+rand(12), vertical at x=10+rand(12)
    ; This creates 4 quadrants for 4 rooms
    RAND r22
    LDI r23, 12
    MOD r22, r23
    ADDI r22, 10       ; split_y (10..21)

    RAND r24
    LDI r23, 12
    MOD r24, r23
    ADDI r24, 10       ; split_x (10..21)

    ; Ensure minimum quadrant size of 4
    ; split_y must be <= 28, split_x must be <= 28
    LDI r23, 28
    CMP r22, r23
    BLT r0, sy_ok
    LDI r22, 28
sy_ok:
    CMP r24, r23
    BLT r0, sx_ok
    LDI r24, 28
sx_ok:
    ; Ensure split_y >= 6 and split_x >= 6
    LDI r23, 6
    CMP r22, r23
    BGE r0, sy2_ok
    LDI r22, 6
sy2_ok:
    CMP r24, r23
    BGE r0, sx2_ok
    LDI r24, 6
sx2_ok:

    ; Place room in top-left quadrant (0,0)-(split_x,split_y)
    LDI r1, 0
    MOV r10, r1        ; rx = 0
    MOV r11, r1        ; ry = 0
    MOV r12, r24       ; rw = split_x
    MOV r13, r22       ; rh = split_y
    LDI r20, 0x4100
    PUSH r31
    CALL place_room
    POP r31

    ; Place room in top-right quadrant (split_x,0)-(32,split_y)
    MOV r10, r24       ; rx = split_x
    LDI r11, 0         ; ry = 0 (use LDI, not MOV r1 -- r1 clobbered by place_room)
    LDI r12, 32
    SUB r12, r24       ; rw = 32 - split_x
    MOV r13, r22       ; rh = split_y
    LDI r20, 0x4110
    PUSH r31
    CALL place_room
    POP r31

    ; Place room in bottom-left quadrant (0,split_y)-(split_x,32)
    LDI r10, 0         ; rx = 0 (use LDI, not MOV r1 -- r1 clobbered by place_room)
    MOV r11, r22       ; ry = split_y
    MOV r12, r24       ; rw = split_x
    LDI r13, 32
    SUB r13, r22       ; rh = 32 - split_y
    LDI r20, 0x4120
    PUSH r31
    CALL place_room
    POP r31

    ; Place room in bottom-right quadrant (split_x,split_y)-(32,32)
    MOV r10, r24       ; rx = split_x
    MOV r11, r22       ; ry = split_y
    LDI r12, 32
    SUB r12, r24       ; rw = 32 - split_x
    LDI r13, 32
    SUB r13, r22       ; rh = 32 - split_y
    LDI r20, 0x4130
    PUSH r31
    CALL place_room
    POP r31

    ; Connect rooms with L-shaped corridors
    ; Room 0 -> Room 1 (horizontal corridor across split)
    LDI r20, 0x4100
    LDI r21, 0x4110
    PUSH r31
    CALL connect_rooms
    POP r31

    ; Room 2 -> Room 3 (horizontal corridor across split)
    LDI r20, 0x4120
    LDI r21, 0x4130
    PUSH r31
    CALL connect_rooms
    POP r31

    ; Room 0 -> Room 2 (vertical corridor across split)
    LDI r20, 0x4100
    LDI r21, 0x4120
    PUSH r31
    CALL connect_rooms
    POP r31

    ; Room 1 -> Room 3 (vertical corridor across split)
    LDI r20, 0x4110
    LDI r21, 0x4130
    PUSH r31
    CALL connect_rooms
    POP r31

    ; Place player in center of room 0
    LDI r20, 0x4100
    LOAD r10, r20       ; room x
    ADDI r20, 1
    LOAD r11, r20       ; room y
    ADDI r20, 1
    LOAD r12, r20       ; room w
    ADDI r20, 1
    LOAD r13, r20       ; room h
    ; player_x = room_x + room_w/2
    MOV r8, r12
    LDI r1, 2
    DIV r8, r1
    ADD r8, r10
    ; player_y = room_y + room_h/2
    MOV r9, r13
    DIV r9, r1
    ADD r9, r11
    ; Store player position
    LDI r20, 0x4000
    STORE r20, r8
    ADDI r20, 1
    STORE r20, r9
    RET

; === PLACE ROOM ===
; Random room within BSP quadrant
; Inputs: r10=rx, r11=ry, r12=rw, r13=rh, r20=room_addr
place_room:
    ; Random room width: 3..min(7, rw-2)
    RAND r14
    LDI r15, 5
    MOD r14, r15
    ADDI r14, 3        ; 3..7
    MOV r1, r12
    SUBI r1, 2
    CMP r14, r1
    BLT r0, rw_ok
    MOV r14, r1
rw_ok:
    CMPI r14, 3
    BGE r0, rw_min
    LDI r14, 3
rw_min:
    ; r14 = room_w

    ; Random room height: 3..min(7, rh-2)
    RAND r15
    LDI r1, 5
    MOD r15, r1
    ADDI r15, 3        ; 3..7
    MOV r1, r13
    SUBI r1, 2
    CMP r15, r1
    BLT r0, rh_ok
    MOV r15, r1
rh_ok:
    CMPI r15, 3
    BGE r0, rh_min
    LDI r15, 3
rh_min:
    ; r15 = room_h

    ; Random x offset: 1..max(1, rw - room_w - 1)
    ; Use MOD instead of CMP to avoid signed comparison on RAND output
    ; (RAND can return values >= 0x80000000 which CMP treats as negative)
    MOV r1, r12
    SUB r1, r14
    SUBI r1, 1          ; r1 = rw - room_w - 1 (max x offset)
    CMPI r1, 1
    BGE r0, ox_ok
    LDI r1, 1
ox_ok:
    ADDI r1, 1          ; r1 = MOD range (max_x_off + 1)
    RAND r16
    MOD r16, r1         ; r16 = 0..max_x_off (uniform, no signed CMP issue)
    ADDI r16, 1         ; r16 = 1..max_x_off+1
    ; r16 = x offset

    ; Random y offset: same MOD pattern
    MOV r1, r13
    SUB r1, r15
    SUBI r1, 1          ; r1 = rh - room_h - 1 (max y offset)
    CMPI r1, 1
    BGE r0, oy_ok
    LDI r1, 1
oy_ok:
    ADDI r1, 1          ; r1 = MOD range (max_y_off + 1)
    RAND r17
    MOD r17, r1         ; r17 = 0..max_y_off (uniform, no signed CMP issue)
    ADDI r17, 1         ; r17 = 1..max_y_off+1
    ; r17 = y offset

    ; room_x = rx + x_off
    ADD r10, r16
    ; room_y = ry + y_off
    ADD r11, r17
    ; r10=room_x, r11=room_y, r14=room_w, r15=room_h

    ; Store room data at r20
    STORE r20, r10
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r14
    ADDI r20, 1
    STORE r20, r15

    ; Carve room into tile map
    PUSH r31
    CALL carve_room
    POP r31
    RET

; === CARVE ROOM ===
; Carve room tiles into map at r6 base
; Inputs: r10=x, r11=y, r14=w, r15=h
; NOTE: Do NOT use r22 or r24 here -- init_dungeon stores split_y/split_x in them
carve_room:
    ; Compute end boundaries BEFORE loops (not inside!)
    MOV r20, r11       ; r20 = y cursor = room_y
    MOV r25, r11       ; r25 = room_y
    ADD r25, r15       ; r25 = end_y = room_y + room_h
cr_yl:
    CMP r20, r25       ; y < end_y?
    BGE r0, cr_done
    MOV r21, r10       ; r21 = x cursor = room_x
    MOV r26, r10       ; r26 = room_x
    ADD r26, r14       ; r26 = end_x = room_x + room_w
cr_xl:
    CMP r21, r26       ; x < end_x?
    BGE r0, cr_ny
    ; addr = y*32 + x + map_base (use r18, NOT r22 which holds split_y)
    MOV r18, r20
    SHL r18, r5
    ADD r18, r21
    ADD r18, r6
    STORE r18, r4      ; tile = 1 (floor)
    ADDI r21, 1
    JMP cr_xl
cr_ny:
    ADDI r20, 1
    JMP cr_yl
cr_done:
    RET

; === CONNECT ROOMS ===
; L-shaped corridor between centers of two rooms
; Inputs: r20=room_a_addr, r21=room_b_addr
connect_rooms:
    ; Load room A center
    LOAD r10, r20      ; ax
    ADDI r20, 1
    LOAD r11, r20      ; ay
    ADDI r20, 1
    LOAD r12, r20      ; aw
    ADDI r20, 1
    LOAD r13, r20      ; ah
    ; center_a_x = ax + aw/2
    MOV r22, r12
    LDI r1, 2
    DIV r22, r1
    ADD r22, r10
    ; center_a_y = ay + ah/2
    MOV r23, r13
    DIV r23, r1
    ADD r23, r11

    ; Load room B center
    LOAD r10, r21      ; bx
    ADDI r21, 1
    LOAD r11, r21      ; by
    ADDI r21, 1
    LOAD r12, r21      ; bw
    ADDI r21, 1
    LOAD r13, r21      ; bh
    ; center_b_x = bx + bw/2
    MOV r24, r12
    DIV r24, r1
    ADD r24, r10
    ; center_b_y = by + bh/2
    MOV r25, r13
    DIV r25, r1
    ADD r25, r11

    ; Carve L-shaped corridor: horizontal from A to B, then vertical
    ; First: horizontal at y=a_y, from a_x to b_x
    MOV r10, r22       ; x start = center_a_x
    MOV r11, r23       ; y = center_a_y
    MOV r12, r24       ; x end = center_b_x
    PUSH r31
    CALL carve_h_corridor
    POP r31

    ; Second: vertical at x=b_x, from a_y to b_y
    MOV r10, r24       ; x = center_b_x
    MOV r11, r23       ; y start = center_a_y
    MOV r12, r25       ; y end = center_b_y
    PUSH r31
    CALL carve_v_corridor
    POP r31
    RET

; === CARVE HORIZONTAL CORRIDOR ===
; Carve floor tiles from x1 to x2 at y
; Inputs: r10=x1, r11=y, r12=x2
carve_h_corridor:
    CMP r10, r12
    BGE r0, ch_done
ch_loop:
    ; Check bounds
    CMPI r10, 32
    BGE r0, ch_done
    CMPI r11, 32
    BGE r0, ch_done
    ; addr = y*32 + x + map_base
    MOV r20, r11
    SHL r20, r5
    ADD r20, r10
    ADD r20, r6
    LDI r1, 1
    STORE r20, r1
    ADDI r10, 1
    CMP r10, r12
    BLT r0, ch_loop
ch_done:
    RET

; === CARVE VERTICAL CORRIDOR ===
; Carve floor tiles from y1 to y2 at x
; Inputs: r10=x, r11=y1, r12=y2
carve_v_corridor:
    CMP r11, r12
    BGE r0, cv_done
cv_loop:
    CMPI r10, 32
    BGE r0, cv_done
    CMPI r11, 32
    BGE r0, cv_done
    ; addr = y*32 + x + map_base
    MOV r20, r11
    SHL r20, r5
    ADD r20, r10
    ADD r20, r6
    LDI r1, 1
    STORE r20, r1
    ADDI r11, 1
    CMP r11, r12
    BLT r0, cv_loop
cv_done:
    RET

; === GAME LOOP ===
game_loop:
    LDI r1, 0
    FILL r1            ; clear screen

    ; Read input
    IKEY r13

    ; Load player position
    LDI r20, 0x4000
    LOAD r8, r20
    ADDI r20, 1
    LOAD r9, r20

    ; R = regenerate
    LDI r1, 82
    CMP r13, r1
    JZ r0, do_regen
    ; W = up
    LDI r1, 87
    CMP r13, r1
    JZ r0, try_up
    ; S = down
    LDI r1, 83
    CMP r13, r1
    JZ r0, try_down
    ; A = left
    LDI r1, 65
    CMP r13, r1
    JZ r0, try_left
    ; D = right
    LDI r1, 68
    CMP r13, r1
    JZ r0, try_right
    JMP do_fog

try_up:
    CMPI r9, 0
    JZ r0, do_fog
    SUBI r9, 1
    JMP try_move

try_down:
    LDI r1, 31
    CMP r9, r1
    BGE r0, do_fog
    ADDI r9, 1
    JMP try_move

try_left:
    CMPI r8, 0
    JZ r0, do_fog
    SUBI r8, 1
    JMP try_move

try_right:
    LDI r1, 31
    CMP r8, r1
    BGE r0, do_fog
    ADDI r8, 1
    JMP try_move

try_move:
    ; Check walkable (map[y*32+x] != 0)
    MOV r20, r9
    SHL r20, r5
    ADD r20, r8
    ADD r20, r6
    LOAD r20, r20
    JNZ r20, do_ok
    JMP do_fog

do_ok:
    LDI r20, 0x4000
    STORE r20, r8
    ADDI r20, 1
    STORE r20, r9
    JMP do_fog

do_regen:
    PUSH r31
    CALL init_dungeon
    POP r31
    LDI r20, 0x4000
    LOAD r8, r20
    ADDI r20, 1
    LOAD r9, r20

do_fog:
    PUSH r31
    CALL fog_update
    POP r31
    PUSH r31
    CALL render_map
    POP r31

    ; Draw player marker (bright green 8x8)
    MOV r20, r8
    LDI r1, 3
    SHL r20, r1        ; px = player_x * 8
    MOV r21, r9
    SHL r21, r1        ; py = player_y * 8
    LDI r22, 8
    LDI r23, 8
    LDI r25, 0x00FF88
    RECTF r20, r21, r22, r23, r25

    FRAME
    JMP game_loop

; === FOG OF WAR ===
; Three states: 0=hidden, 1=explored (previously visible), 2=visible (current)
; Uses Bresenham raycasting for true line-of-sight
; Casts rays from player to every tile on the bounding box perimeter
; Each ray marks tiles visible until it hits a wall
fog_update:
    ; Pass 1: downgrade all visible(2) to explored(1)
    LDI r20, 0
    LDI r21, 1024
fog_d1:
    CMP r20, r21
    BGE r0, fog_p2
    MOV r22, r7
    ADD r22, r20
    LOAD r22, r22
    LDI r1, 2
    CMP r22, r1
    JZ r0, fd1_down
    JMP fd1_next
fd1_down:
    MOV r22, r7
    ADD r22, r20
    LDI r1, 1
    STORE r22, r1
fd1_next:
    ADDI r20, 1
    JMP fog_d1

fog_p2:
    ; Cast rays to perimeter of bounding box around player
    ; r20 = radius (9), r21 = px, r22 = py
    LDI r20, 9
    MOV r21, r8
    MOV r22, r9

    ; --- Top edge: y = py - r, x from px-r to px+r ---
    ; r23 = target y, r24 = offset (0 to 2*r)
    MOV r23, r22
    SUB r23, r20       ; ty = py - 9
    LDI r24, 0         ; offset = 0
fog_top:
    ; if offset > 2*radius, move to next edge
    MOV r25, r24
    ADD r25, r20
    ADD r25, r20       ; r25 = offset + 18
    LDI r1, 19
    CMP r24, r1
    BGE r0, fog_bot    ; offset >= 19, done with top
    ; target_x = px - r + offset
    MOV r25, r21
    SUB r25, r20
    ADD r25, r24
    ; Circle check: dx^2 + dy^2 <= r^2 (dy = r always for top edge)
    ; dx = offset - r, dx^2 = (offset-r)^2
    MOV r26, r24
    SUB r26, r20       ; dx = offset - 9
    MUL r26, r26       ; dx^2
    MOV r27, r20
    MUL r27, r27       ; r^2 = 81
    ADD r26, r27       ; dx^2 + r^2
    ; Need dx^2 + dy^2 <= 81, but dy = r so dy^2 = 81
    ; This means dx must be 0, so only the center tile qualifies
    ; Actually: dx^2 + dy^2 = dx^2 + r^2 <= r^2 => dx^2 <= 0 => dx=0
    ; That means the top edge ONLY has the center tile in the circle!
    ; That's wrong for FOV. We want to cast to ALL perimeter tiles.
    ; For FOV, we should cast to all tiles within radius, not just on circle.
    ; Let me just skip the circle check and cast to all perimeter tiles.
    ; Some rays will be longer than radius but that's fine for coverage.
    PUSH r31
    MOV r10, r21       ; x0 = player_x
    MOV r11, r22       ; y0 = player_y
    MOV r12, r25       ; x1 = target_x
    MOV r13, r23       ; y1 = target_y
    CALL cast_ray
    POP r31
    ADDI r24, 1
    JMP fog_top

fog_bot:
    ; Bottom edge: y = py + r, x from px-r to px+r
    MOV r23, r22
    ADD r23, r20       ; ty = py + 9
    LDI r24, 0
fog_bot_l:
    LDI r1, 19
    CMP r24, r1
    BGE r0, fog_left
    MOV r25, r21
    SUB r25, r20
    ADD r25, r24
    PUSH r31
    MOV r10, r21
    MOV r11, r22
    MOV r12, r25
    MOV r13, r23
    CALL cast_ray
    POP r31
    ADDI r24, 1
    JMP fog_bot_l

fog_left:
    ; Left edge: x = px - r, y from py-r+1 to py+r-1 (skip corners)
    MOV r25, r21
    SUB r25, r20       ; tx = px - 9
    LDI r24, 1         ; start at 1 (skip top-left corner)
fog_left_l:
    LDI r1, 18
    CMP r24, r1
    BGE r0, fog_right  ; offset >= 18, done (skip bottom-left corner)
    ; target_y = py - r + offset
    MOV r23, r22
    SUB r23, r20
    ADD r23, r24
    PUSH r31
    MOV r10, r21
    MOV r11, r22
    MOV r12, r25
    MOV r13, r23
    CALL cast_ray
    POP r31
    ADDI r24, 1
    JMP fog_left_l

fog_right:
    ; Right edge: x = px + r, y from py-r+1 to py+r-1
    MOV r25, r21
    ADD r25, r20       ; tx = px + 9
    LDI r24, 1
fog_right_l:
    LDI r1, 18
    CMP r24, r1
    BGE r0, fog_done
    MOV r23, r22
    SUB r23, r20
    ADD r23, r24
    PUSH r31
    MOV r10, r21
    MOV r11, r22
    MOV r12, r25
    MOV r13, r23
    CALL cast_ray
    POP r31
    ADDI r24, 1
    JMP fog_right_l

fog_done:
    RET

; === BRESENHAM RAY CAST ===
; Trace line from (r10,r11) to (r12,r13) using Bresenham's algorithm
; Marks each tile as visible (fog=2) until a wall is hit
; Wall tiles get marked visible but stop the ray
cast_ray:
    ; dx_raw = x1 - x0, dy_raw = y1 - y0
    MOV r14, r12
    SUB r14, r10       ; dx (signed)
    MOV r15, r13
    SUB r15, r11       ; dy (signed)

    ; sx = sign(dx): 1 if dx >= 0, else -1
    LDI r17, 1
    LDI r1, 31
    MOV r19, r14
    SAR r19, r1
    JZ r19, cr_sy_pos
    LDI r17, 0xFFFFFFFF
cr_sy_pos:
    ; sy = sign(dy): 1 if dy >= 0, else -1
    LDI r18, 1
    MOV r19, r15
    SAR r19, r1
    JZ r19, cr_abs
    LDI r18, 0xFFFFFFFF

cr_abs:
    ; abs(dx) and abs(dy) using conditional negate
    MOV r19, r14
    SAR r19, r1
    JZ r19, cr_abs_dy
    NEG r14
cr_abs_dy:
    MOV r19, r15
    SAR r19, r1
    JZ r19, cr_init
    NEG r15

cr_init:
    ; err = adx - ady
    MOV r16, r14
    SUB r16, r15
    ; x = x0, y = y0 (already in r10, r11)

cr_loop:
    ; Mark tile (r10, r11) as visible if in bounds
    CMPI r10, 32
    BGE r0, cr_end
    CMPI r11, 32
    BGE r0, cr_end
    ; vis[y*32 + x] = 2
    MOV r19, r11
    SHL r19, r5
    ADD r19, r10
    ADD r19, r7
    LDI r1, 2
    STORE r19, r1

    ; Check if wall: map[y*32 + x] == 0
    MOV r19, r11
    SHL r19, r5
    ADD r19, r10
    ADD r19, r6
    LOAD r19, r19
    JZ r19, cr_end     ; wall hit, stop

    ; Check if reached target
    CMP r10, r12
    JNZ r0, cr_step
    CMP r11, r13
    JZ r0, cr_end

cr_step:
    ; e2 = 2 * err
    MOV r19, r16
    SHL r19, r4        ; e2 = err * 2

    ; Standard Bresenham: two independent checks
    ; Check 1: if e2 > -ady (i.e., e2 + ady > 0): step x, err -= ady
    MOV r1, r19
    ADD r1, r15        ; r1 = e2 + ady
    LDI r26, 0
    CMP r1, r26
    BLT r0, cr_no_x   ; skip if e2 + ady < 0
    ; Step x
    SUB r16, r15       ; err -= ady
    ADD r10, r17       ; x += sx
cr_no_x:
    ; Check 2: if e2 < adx (i.e., e2 - adx < 0): step y, err += adx
    MOV r1, r19
    SUB r1, r14        ; r1 = e2 - adx
    LDI r26, 0
    CMP r1, r26
    BGE r0, cr_no_y   ; skip if e2 - adx >= 0
    ; Step y
    ADD r16, r14       ; err += adx
    ADD r11, r18       ; y += sy
cr_no_y:
    JMP cr_loop

cr_end:
    RET

; === RENDER MAP ===
; Render 32x32 tiles as 8x8 pixel blocks
; Color based on tile type and visibility state
render_map:
    LDI r20, 0         ; y
rm_yl:
    CMPI r20, 32
    BGE r0, rm_done
    LDI r21, 0         ; x
rm_xl:
    CMPI r21, 32
    BGE r0, rm_ny

    ; tile_idx = y*32 + x
    MOV r22, r20
    SHL r22, r5
    ADD r22, r21

    ; Get tile type (0=wall, 1=floor)
    MOV r23, r6
    ADD r23, r22
    LOAD r23, r23

    ; Get visibility (0=hidden, 1=explored, 2=visible)
    MOV r24, r7
    ADD r24, r22
    LOAD r24, r24

    ; Skip hidden tiles (render as black from FILL)
    LDI r1, 0
    CMP r24, r1
    JZ r0, rm_skip

    ; Compute color LUT index: vis*3 + tile_type
    ; vis=1: explored, vis=2: visible
    LDI r25, 0
    CMP r24, r4        ; vis == 1?
    JZ r0, is_explored
    ; vis == 2 (visible)
    LDI r25, 0
    CMP r23, r1        ; tile == 0 (wall)?
    JZ r0, vis_wall
    ; visible floor
    LDI r25, 0x8888CC
    JMP draw_tile
vis_wall:
    LDI r25, 0x5566AA
    JMP draw_tile

is_explored:
    LDI r25, 0
    CMP r23, r1        ; tile == 0 (wall)?
    JZ r0, exp_wall
    ; explored floor
    LDI r25, 0x1E1E36
    JMP draw_tile
exp_wall:
    LDI r25, 0x2A2A44
    JMP draw_tile

draw_tile:
    ; px = x * 8, py = y * 8
    MOV r26, r21
    LDI r1, 3
    SHL r26, r1
    MOV r27, r20
    SHL r27, r1
    LDI r28, 8
    LDI r29, 8
    RECTF r26, r27, r28, r29, r25

rm_skip:
    ADDI r21, 1
    JMP rm_xl
rm_ny:
    ADDI r20, 1
    JMP rm_yl
rm_done:
    RET
