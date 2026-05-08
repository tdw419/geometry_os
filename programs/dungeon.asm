; Geometry OS - Procedural Dungeon Generator with Fog of War
; Controls: WASD=move, R=regenerate
; Map: 32x32 tiles, 8x8 pixels each (256x256 screen)
;
; Memory Map
; 0x2000..0x23FF  map[1024]       (0=wall, 1=floor, 2=corridor)
; 0x3000..0x33FF  vis[1024]       (0=hidden, 1=explored, 2=visible)
; 0x4000         player_x
; 0x4001         player_y
; 0x6200         debug_rays (tiles checked in fog)
;
; Register Convention
; r4  = 1 (constant)
; r5  = 5 (for SHL multiply by 32)
; r6  = 0x2000 (map base)
; r7  = 0x3000 (vis base)
; r8  = player_x
; r9  = player_y
; r10 = temp
; r11 = temp
; r12 = temp
; r13 = temp
; r14 = temp
; r15 = temp
; r16 = temp (room x)
; r17 = temp (room y)
; r18 = temp (room w)
; r19 = temp (room h)
; r20-r25 = temps
; r30 = SP, r31 = LR

; === INIT ===
    LDI r30, 0xFF00
    LDI r4, 1
    LDI r5, 5
    LDI r6, 0x2000
    LDI r7, 0x3000
    CALL gen_dungeon
    JMP game_loop

; === GENERATE DUNGEON ===
; Deterministic 3x3 grid of rooms with corridors
gen_dungeon:
    PUSH r31
    ; Clear map (1024 words of 0)
    LDI r10, 0x2000
    LDI r11, 0x2400
    LDI r12, 0
clr_map:
    CMP r10, r11
    BGE r0, clr_vis
    STORE r10, r12
    ADD r10, r4
    JMP clr_map
clr_vis:
    ; Clear vis (1024 words of 0)
    LDI r10, 0x3000
    LDI r11, 0x3400
clr_vis_l:
    CMP r10, r11
    BGE r0, gen_rooms
    STORE r10, r12
    ADD r10, r4
    JMP clr_vis_l

gen_rooms:
    ; Carve 9 rooms in 3x3 grid
    ; Each grid cell is 10 tiles, rooms are 5x5 centered in cell
    ; Room positions: (1,1) (11,1) (21,1) (1,11) (11,11) (21,11) (1,21) (11,21) (21,21)
    ; Room 0: (1,1) 5x5
    LDI r16, 1
    LDI r17, 1
    LDI r18, 5
    LDI r19, 5
    CALL carve_room
    ; Room 1: (11,1) 5x5
    LDI r16, 11
    LDI r17, 1
    LDI r18, 5
    LDI r19, 5
    CALL carve_room
    ; Room 2: (21,1) 5x5
    LDI r16, 21
    LDI r17, 1
    LDI r18, 5
    LDI r19, 5
    CALL carve_room
    ; Room 3: (1,11) 5x5
    LDI r16, 1
    LDI r17, 11
    LDI r18, 5
    LDI r19, 5
    CALL carve_room
    ; Room 4: (11,11) 5x5 (center)
    LDI r16, 11
    LDI r17, 11
    LDI r18, 5
    LDI r19, 5
    CALL carve_room
    ; Room 5: (21,11) 5x5
    LDI r16, 21
    LDI r17, 11
    LDI r18, 5
    LDI r19, 5
    CALL carve_room
    ; Room 6: (1,21) 5x5
    LDI r16, 1
    LDI r17, 21
    LDI r18, 5
    LDI r19, 5
    CALL carve_room
    ; Room 7: (11,21) 5x5
    LDI r16, 11
    LDI r17, 21
    LDI r18, 5
    LDI r19, 5
    CALL carve_room
    ; Room 8: (21,21) 5x5
    LDI r16, 21
    LDI r17, 21
    LDI r18, 5
    LDI r19, 5
    CALL carve_room

    ; Connect rooms with corridors
    ; Horizontal: 0->1 (y=3, x: 6 to 10), 1->2 (y=3, x: 16 to 20)
    ;            3->4 (y=13, x: 6 to 10), 4->5 (y=13, x: 16 to 20)
    ;            6->7 (y=23, x: 6 to 10), 7->8 (y=23, x: 16 to 20)
    LDI r17, 3
    CALL carve_h_corridor
    LDI r17, 13
    CALL carve_h_corridor
    LDI r17, 23
    CALL carve_h_corridor

    ; Vertical: 0->3 (x=3, y: 6 to 10), 3->6 (x=3, y: 16 to 20)
    ;           1->4 (x=13, y: 6 to 10), 4->7 (x=13, y: 16 to 20)
    ;           2->5 (x=23, y: 6 to 10), 5->8 (x=23, y: 16 to 20)
    LDI r16, 3
    CALL carve_v_corridor
    LDI r16, 13
    CALL carve_v_corridor
    LDI r16, 23
    CALL carve_v_corridor

    ; Player at center of room 4 (11+2, 11+2 = 13, 13)
    LDI r10, 0x4000
    LDI r11, 13
    STORE r10, r11
    ADD r10, r4
    STORE r10, r11
    POP r31
    RET

; === CARVE ROOM ===
; Input: r16=x, r17=y, r18=w, r19=h
carve_room:
    MOV r10, r17
cr_yl:
    MOV r11, r10
    ADD r11, r19
    CMP r10, r11
    BGE r0, cr_done
    MOV r11, r16
cr_xl:
    MOV r12, r11
    ADD r12, r18
    CMP r11, r12
    BGE r0, cr_ny
    ; addr = y*32 + x + 0x2000
    MOV r12, r10
    SHL r12, r5
    ADD r12, r11
    ADD r12, r6
    STORE r12, r4
    ADD r11, r4
    JMP cr_xl
cr_ny:
    ADD r10, r4
    JMP cr_yl
cr_done:
    RET

; === CARVE HORIZONTAL CORRIDORS ===
; Carves 3 corridors at y positions 3, 13, 23
; Between columns: x=6..10 and x=16..20
carve_h_corridor:
    ; Corridor at y=r17, x=6 to x=10
    LDI r10, 6
    LDI r11, 11
ch1:
    CMP r10, r11
    BGE r0, ch2
    MOV r12, r17
    SHL r12, r5
    ADD r12, r10
    ADD r12, r6
    LDI r13, 2
    STORE r12, r13
    ADD r10, r4
    JMP ch1
ch2:
    ; Corridor at y=r17, x=16 to x=20
    LDI r10, 16
    LDI r11, 21
ch3:
    CMP r10, r11
    BGE r0, ch_done
    MOV r12, r17
    SHL r12, r5
    ADD r12, r10
    ADD r12, r6
    LDI r13, 2
    STORE r12, r13
    ADD r10, r4
    JMP ch3
ch_done:
    RET

; === CARVE VERTICAL CORRIDORS ===
; Carves 3 corridors at x positions 3, 13, 23
; Between rows: y=6..10 and y=16..20
carve_v_corridor:
    ; Corridor at x=r16, y=6 to y=10
    LDI r10, 6
    LDI r11, 11
cv1:
    CMP r10, r11
    BGE r0, cv2
    MOV r12, r10
    SHL r12, r5
    ADD r12, r16
    ADD r12, r6
    LDI r13, 2
    STORE r12, r13
    ADD r10, r4
    JMP cv1
cv2:
    ; Corridor at x=r16, y=16 to y=20
    LDI r10, 16
    LDI r11, 21
cv3:
    CMP r10, r11
    BGE r0, cv_done
    MOV r12, r10
    SHL r12, r5
    ADD r12, r16
    ADD r12, r6
    LDI r13, 2
    STORE r12, r13
    ADD r10, r4
    JMP cv3
cv_done:
    RET

; === GAME LOOP ===
game_loop:
    LDI r10, 0
    FILL r10
    IKEY r13
    LDI r10, 0x4000
    LOAD r8, r10
    ADD r10, r4
    LOAD r9, r10

    ; R = regenerate
    LDI r10, 82
    CMP r13, r10
    JZ r0, do_regen
    ; W = up
    LDI r10, 87
    CMP r13, r10
    JZ r0, try_up
    ; S = down
    LDI r10, 83
    CMP r13, r10
    JZ r0, try_down
    ; A = left
    LDI r10, 65
    CMP r13, r10
    JZ r0, try_left
    ; D = right
    LDI r10, 68
    CMP r13, r10
    JZ r0, try_right
    JMP do_fog

try_up:
    LDI r10, 0
    CMP r9, r10
    JZ r0, do_fog
    SUB r9, r4
    JMP try_move

try_down:
    LDI r10, 31
    CMP r9, r10
    BGE r0, do_fog
    ADD r9, r4
    JMP try_move

try_left:
    LDI r10, 0
    CMP r8, r10
    JZ r0, do_fog
    SUB r8, r4
    JMP try_move

try_right:
    LDI r10, 31
    CMP r8, r10
    BGE r0, do_fog
    ADD r8, r4
    JMP try_move

try_move:
    ; Check if walkable (map[tile] != 0)
    MOV r10, r9
    SHL r10, r5
    ADD r10, r8
    ADD r10, r6
    LOAD r10, r10
    JNZ r10, do_ok
    JMP do_fog

do_ok:
    LDI r10, 0x4000
    STORE r10, r8
    ADD r10, r4
    STORE r10, r9
    JMP do_fog

do_regen:
    CALL gen_dungeon
    LDI r10, 0x4000
    LOAD r8, r10
    ADD r10, r4
    LOAD r9, r10

do_fog:
    CALL fog_cast
    CALL render_map
    ; Draw player marker (bright green 8x8)
    MOV r20, r8
    LDI r21, 3
    SHL r20, r21
    MOV r21, r9
    LDI r22, 3
    SHL r21, r22
    LDI r22, 8
    LDI r23, 8
    LDI r25, 0x00FF88
    RECTF r20, r21, r22, r23, r25
    FRAME
    JMP game_loop

; === FOG OF WAR ===
; Sets vis[]: 0=hidden, 1=explored (was visible before), 2=visible (current)
; First pass: mark all 2s as 1s (explored), then mark radius-8 tiles as 2
fog_cast:
    ; Pass 1: downgrade visible(2) to explored(1)
    LDI r10, 0
    LDI r11, 1024
fog_d1:
    CMP r10, r11
    BGE r0, fog_p2
    MOV r12, r7
    ADD r12, r10
    LOAD r12, r12
    LDI r13, 2
    CMP r12, r13
    JZ r0, fd1_down
    JMP fd1_next
fd1_down:
    MOV r12, r7
    ADD r12, r10
    LDI r13, 1
    STORE r12, r13
fd1_next:
    ADD r10, r4
    JMP fog_d1

fog_p2:
    ; Pass 2: mark tiles in radius 8 as visible(2)
    LDI r10, 0
    LDI r14, 1024
    LDI r15, 65       ; radius^2 = 8*8 + 1
fog_p2l:
    CMP r10, r14
    BGE r0, fog_done
    ; ty = tile / 32
    MOV r11, r10
    SHR r11, r5
    ; tx = tile & 31
    MOV r12, r10
    LDI r13, 31
    AND r12, r13
    ; dx = tx - player_x
    MOV r20, r12
    SUB r20, r8
    ; dy = ty - player_y
    MOV r21, r11
    SUB r21, r9
    ; dist_sq = dx*dx + dy*dy
    MUL r20, r20
    MUL r21, r21
    ADD r20, r21
    CMP r20, r15
    BGE r0, fog_p2s
    ; vis[tile] = 2 (visible)
    MOV r20, r7
    ADD r20, r10
    LDI r21, 2
    STORE r20, r21
fog_p2s:
    ADD r10, r4
    JMP fog_p2l
fog_done:
    ; Debug: count tiles in radius
    LDI r10, 0x6200
    LDI r11, 0
    STORE r10, r11
    RET

; === RENDER MAP ===
render_map:
    LDI r10, 0
rm_yl:
    LDI r20, 32
    CMP r10, r20
    BGE r0, rm_done
    LDI r11, 0
rm_xl:
    CMP r11, r20
    BGE r0, rm_ny
    ; tile_index = y*32 + x
    MOV r12, r10
    SHL r12, r5
    ADD r12, r11
    ; Get map value
    MOV r13, r6
    ADD r13, r12
    LOAD r13, r13
    ; Get vis value
    MOV r14, r7
    ADD r14, r12
    LOAD r14, r14
    ; vis: 0=hidden, 1=explored, 2=visible
    LDI r15, 2
    CMP r14, r15
    JZ r0, is_vis
    LDI r15, 1
    CMP r14, r15
    JZ r0, is_explored
    JMP rm_skip
is_vis:
    ; map: 0=wall, 1=floor, 2=corridor
    LDI r15, 0
    CMP r13, r15
    JZ r0, vis_wall
    LDI r15, 1
    CMP r13, r15
    JZ r0, vis_floor
    LDI r25, 0x998866
    JMP draw_tile
vis_floor:
    LDI r25, 0xBBAA77
    JMP draw_tile
vis_wall:
    LDI r25, 0x445566
    JMP draw_tile
is_explored:
    LDI r15, 0
    CMP r13, r15
    JZ r0, exp_wall
    LDI r15, 1
    CMP r13, r15
    JZ r0, exp_floor
    LDI r25, 0x443322
    JMP draw_tile
exp_floor:
    LDI r25, 0x554433
    JMP draw_tile
exp_wall:
    LDI r25, 0x222233
    JMP draw_tile
draw_tile:
    MOV r20, r11
    LDI r21, 3
    SHL r20, r21
    MOV r21, r10
    LDI r22, 3
    SHL r21, r22
    LDI r22, 8
    LDI r23, 8
    RECTF r20, r21, r22, r23, r25
rm_skip:
    ADD r11, r4
    JMP rm_xl
rm_ny:
    ADD r10, r4
    JMP rm_yl
rm_done:
    RET
