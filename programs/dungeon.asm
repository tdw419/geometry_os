; dungeon.asm -- Procedural Dungeon Crawler with Fog of War
; BSP room generation, L-shaped corridors, Bresenham LOS
; Controls: W/A/S/D = move, R = new dungeon, Q = quit
;
; 32x32 tile map, 8x8 pixel tiles = 256x256 screen
;
; Memory map:
;   0x2000-0x23FF  Tiles (1024: 0=wall, 1=floor)
;   0x3000-0x33FF  Visibility (1024: 0=hidden, 1=explored, 2=visible)
;   0x4000-0x4003  Player (x, y, hp, level)
;   0x4100-0x410F  Room 0 (x, y, w, h)
;   0x4110-0x411F  Room 1 (x, y, w, h)
;   0x4120-0x412F  Room 2 (x, y, w, h)
;   0x4130-0x413F  Room 3 (x, y, w, h)
;   0x6000-0x6005  Color LUT (6 entries)
;   0x6100-0x6101  Stairs (x, y)
;   0x6102         Stairs flag (0=no, 1=stepped)

; ═══════════════════════════════════════════════════════════
; ENTRY
; ═══════════════════════════════════════════════════════════
restart:
  LDI r30, 0xFE00
  LDI r29, 0

new_dungeon:
  PUSH r31
  CALL init_colors
  POP r31
  PUSH r31
  CALL init_dungeon
  POP r31
  JMP game_loop

; ═══════════════════════════════════════════════════════════
; COLOR TABLE
; Index = visibility + tile_type * 3
; Wall(0):  0=hidden  1=explored  2=visible
; Floor(1): 3=hidden  4=explored  5=visible
; ═══════════════════════════════════════════════════════════
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

; ═══════════════════════════════════════════════════════════
; DUNGEON INITIALIZATION
; ═══════════════════════════════════════════════════════════
init_dungeon:
  ; Clear tile map
  LDI r20, 0x2000
  LDI r21, 1024
  LDI r1, 0
clr_tiles:
  JZ r21, clr_vis
  STORE r20, r1
  ADDI r20, 1
  SUBI r21, 1
  JMP clr_tiles

clr_vis:
  ; Clear visibility map
  LDI r20, 0x3000
  LDI r21, 1024
clr_v:
  JZ r21, bsp_start
  STORE r20, r1
  ADDI r20, 1
  SUBI r21, 1
  JMP clr_v

bsp_start:
  ; Clear stairs flag
  LDI r20, 0x6102
  STORE r20, r1

  ; BSP split: horizontal at y=13+rand(6), vertical at x=13+rand(6)
  RAND r22
  LDI r23, 6
  MOD r22, r23
  ADDI r22, 13       ; split_y

  RAND r24
  MOD r24, r23
  ADDI r24, 13       ; split_x

  ; Place room in top-left quadrant
  LDI r4, 0
  LDI r5, 0
  MOV r6, r24
  MOV r7, r22
  LDI r20, 0x4100
  PUSH r31
  CALL place_room
  POP r31

  ; Place room in top-right quadrant
  MOV r4, r24
  LDI r5, 0
  LDI r23, 32
  MOV r6, r23
  SUB r6, r24
  MOV r7, r22
  LDI r20, 0x4110
  PUSH r31
  CALL place_room
  POP r31

  ; Place room in bottom-left quadrant
  LDI r4, 0
  MOV r5, r22
  MOV r6, r24
  MOV r7, r23
  SUB r7, r22
  LDI r20, 0x4120
  PUSH r31
  CALL place_room
  POP r31

  ; Place room in bottom-right quadrant
  MOV r4, r24
  MOV r5, r22
  MOV r6, r23
  SUB r6, r24
  MOV r7, r23
  SUB r7, r22
  LDI r20, 0x4130
  PUSH r31
  CALL place_room
  POP r31

  ; Connect rooms with corridors
  PUSH r31
  CALL connect_rooms
  POP r31

  ; Place player in center of room 0
  LDI r20, 0x4100
  LOAD r4, r20
  ADDI r20, 1
  LOAD r5, r20
  ADDI r20, 1
  LOAD r6, r20
  ADDI r20, 1
  LOAD r7, r20
  MOV r8, r6
  LDI r9, 2
  DIV r8, r9
  ADD r8, r4
  MOV r10, r7
  DIV r10, r9
  ADD r10, r5
  LDI r20, 0x4000
  STORE r20, r8
  ADDI r20, 1
  STORE r20, r10
  ADDI r20, 1
  LDI r1, 10
  STORE r20, r1
  ADDI r20, 1
  STORE r20, r29

  ; Place stairs in center of room 3
  LDI r20, 0x4130
  LOAD r4, r20
  ADDI r20, 1
  LOAD r5, r20
  ADDI r20, 1
  LOAD r6, r20
  ADDI r20, 1
  LOAD r7, r20
  MOV r8, r6
  LDI r9, 2
  DIV r8, r9
  ADD r8, r4
  MOV r10, r7
  DIV r10, r9
  ADD r10, r5
  LDI r20, 0x6100
  STORE r20, r8
  ADDI r20, 1
  STORE r20, r10
  RET

; ═══════════════════════════════════════════════════════════
; PLACE ROOM -- random room within BSP region
; Inputs: r4=rx, r5=ry, r6=rw, r7=rh, r20=room_addr
; ═══════════════════════════════════════════════════════════
place_room:
  ; Random room width: 3..min(7, rw-2)
  RAND r9
  LDI r10, 5
  MOD r9, r10
  ADDI r9, 3           ; 3..7
  MOV r8, r6
  SUBI r8, 2
  CMP r9, r8
  BLT r0, rw_ok
  MOV r9, r8
rw_ok:
  CMPI r9, 3
  BGE r0, rw_min
  LDI r9, 3
rw_min:
  ; r9 = room_w

  ; Random room height
  RAND r10
  LDI r11, 5
  MOD r10, r11
  ADDI r10, 3
  MOV r8, r7
  SUBI r8, 2
  CMP r10, r8
  BLT r0, rh_ok
  MOV r10, r8
rh_ok:
  CMPI r10, 3
  BGE r0, rh_min
  LDI r10, 3
rh_min:
  ; r10 = room_h

  ; Random x offset: 1..max(1, rw - room_w - 2)
  MOV r8, r6
  SUB r8, r9
  SUBI r8, 2
  CMPI r8, 1
  BGE r0, ox_ok
  LDI r8, 1
ox_ok:
  RAND r11
  CMP r11, r8
  BLT r0, ox_big
  MOD r11, r8
  ADDI r11, 1
  JMP ox_set
ox_big:
  LDI r11, 1
ox_set:
  ADD r11, r4          ; room_x

  ; Random y offset
  MOV r8, r7
  SUB r8, r10
  SUBI r8, 2
  CMPI r8, 1
  BGE r0, oy_ok
  LDI r8, 1
oy_ok:
  RAND r12
  CMP r12, r8
  BLT r0, oy_big
  MOD r12, r8
  ADDI r12, 1
  JMP oy_set
oy_big:
  LDI r12, 1
oy_set:
  ADD r12, r5          ; room_y

  ; Store room data
  STORE r20, r11
  ADDI r20, 1
  STORE r20, r12
  ADDI r20, 1
  STORE r20, r9
  ADDI r20, 1
  STORE r20, r10
  SUBI r20, 4          ; back to room base for carve

  ; Carve the room
  PUSH r31
  CALL carve_room
  POP r31
  RET

; ═══════════════════════════════════════════════════════════
; CARVE ROOM -- set tiles to floor
; r20 = room_addr (x, y, w, h)
; ═══════════════════════════════════════════════════════════
carve_room:
  LOAD r4, r20
  ADDI r20, 1
  LOAD r5, r20
  ADDI r20, 1
  LOAD r6, r20
  ADDI r20, 1
  LOAD r7, r20
  LDI r16, 0
cr_y:
  CMP r16, r7
  BGE r0, cr_done
  LDI r17, 0
cr_x:
  CMP r17, r6
  BGE r0, cr_ny
  MOV r18, r5
  ADD r18, r16
  SHLI r18, 5
  ADD r18, r4
  ADD r18, r17
  LDI r19, 0x2000
  ADD r19, r18
  LDI r18, 1
  STORE r19, r18
  ADDI r17, 1
  JMP cr_x
cr_ny:
  ADDI r16, 1
  JMP cr_y
cr_done:
  RET

; ═══════════════════════════════════════════════════════════
; ROOM CENTER -- compute center of a room
; r20 = room_addr
; Returns: r8=cx, r9=cy
; ═══════════════════════════════════════════════════════════
room_center:
  LOAD r8, r20
  ADDI r20, 1
  LOAD r9, r20
  ADDI r20, 1
  LOAD r10, r20
  ADDI r20, 1
  LOAD r11, r20
  MOV r12, r10
  LDI r13, 2
  DIV r12, r13
  ADD r8, r12
  MOV r12, r11
  DIV r12, r13
  ADD r9, r12
  RET

; ═══════════════════════════════════════════════════════════
; CONNECT ROOMS -- L-shaped corridors between rooms
; ═══════════════════════════════════════════════════════════
connect_rooms:
  ; Room 0 -> Room 1 (horizontal)
  LDI r20, 0x4100
  PUSH r31
  CALL room_center
  POP r31
  MOV r25, r8
  MOV r26, r9

  LDI r20, 0x4110
  PUSH r31
  CALL room_center
  POP r31
  ; Horizontal: from (r25, r26) to (r8, r26)
  MOV r4, r25
  MOV r5, r26
  MOV r6, r8
  MOV r7, r26
  PUSH r31
  CALL carve_h_corridor
  POP r31
  ; Vertical: from (r8, r26) to (r8, r9)
  MOV r4, r8
  MOV r5, r26
  MOV r6, r8
  MOV r7, r9
  PUSH r31
  CALL carve_v_corridor
  POP r31

  ; Room 0 -> Room 2 (vertical)
  LDI r20, 0x4100
  PUSH r31
  CALL room_center
  POP r31
  MOV r25, r8
  MOV r26, r9

  LDI r20, 0x4120
  PUSH r31
  CALL room_center
  POP r31
  ; Vertical: from (r25, r26) to (r25, r9)
  MOV r4, r25
  MOV r5, r26
  MOV r6, r25
  MOV r7, r9
  PUSH r31
  CALL carve_v_corridor
  POP r31
  ; Horizontal: from (r25, r9) to (r8, r9)
  MOV r4, r25
  MOV r5, r9
  MOV r6, r8
  MOV r7, r9
  PUSH r31
  CALL carve_h_corridor
  POP r31

  ; Room 1 -> Room 3 (vertical)
  LDI r20, 0x4110
  PUSH r31
  CALL room_center
  POP r31
  MOV r25, r8
  MOV r26, r9

  LDI r20, 0x4130
  PUSH r31
  CALL room_center
  POP r31
  ; Vertical: from (r25, r26) to (r25, r9)
  MOV r4, r25
  MOV r5, r26
  MOV r6, r25
  MOV r7, r9
  PUSH r31
  CALL carve_v_corridor
  POP r31
  ; Horizontal: from (r25, r9) to (r8, r9)
  MOV r4, r25
  MOV r5, r9
  MOV r6, r8
  MOV r7, r9
  PUSH r31
  CALL carve_h_corridor
  POP r31

  RET

; ═══════════════════════════════════════════════════════════
; CARVE HORIZONTAL CORRIDOR at y, from x1 to x2
; r4=x1, r5=y, r6=x2
; ═══════════════════════════════════════════════════════════
carve_h_corridor:
  CMP r4, r6
  BLT r0, hc_x1_lt
  MOV r8, r6
  MOV r9, r4
  JMP hc_setup
hc_x1_lt:
  MOV r8, r4
  MOV r9, r6
hc_setup:
  LDI r20, 0x2000
  SHLI r5, 5
  ADD r20, r5
  ADD r20, r8
  MOV r11, r9
  SUB r11, r8
  ADDI r11, 1
hc_lp:
  JZ r11, hc_done
  LDI r1, 1
  STORE r20, r1
  ADDI r20, 1
  SUBI r11, 1
  JMP hc_lp
hc_done:
  RET

; ═══════════════════════════════════════════════════════════
; CARVE VERTICAL CORRIDOR at x, from y1 to y2
; r4=x, r5=y1, r7=y2
; ═══════════════════════════════════════════════════════════
carve_v_corridor:
  CMP r5, r7
  BLT r0, vc_y1_lt
  MOV r8, r7
  MOV r9, r5
  JMP vc_setup
vc_y1_lt:
  MOV r8, r5
  MOV r9, r7
vc_setup:
  MOV r10, r8
  MOV r11, r9
  SUB r11, r10
  ADDI r11, 1
  LDI r20, 0x2000
  SHLI r10, 5
  ADD r20, r10
  ADD r20, r4
vc_lp:
  JZ r11, vc_done
  LDI r1, 1
  STORE r20, r1
  ADDI r20, 32
  SUBI r11, 1
  JMP vc_lp
vc_done:
  RET

; ═══════════════════════════════════════════════════════════
; GAME LOOP
; ═══════════════════════════════════════════════════════════
game_loop:
  LDI r28, 0x0C0C18
  FILL r28

  PUSH r31
  CALL compute_los
  POP r31

  PUSH r31
  CALL render_map
  POP r31

  PUSH r31
  CALL draw_entities
  POP r31

  PUSH r31
  CALL handle_input
  POP r31

  FRAME
  JMP game_loop

; ═══════════════════════════════════════════════════════════
; LINE OF SIGHT -- Bresenham raycast from player
; ═══════════════════════════════════════════════════════════
compute_los:
  ; Reset visible (2) -> explored (1)
  LDI r20, 0x3000
  LDI r21, 1024
los_rst:
  JZ r21, los_px
  LOAD r22, r20
  CMPI r22, 2
  JNZ r0, los_rst_skip
  LDI r22, 1
  STORE r20, r22
los_rst_skip:
  ADDI r20, 1
  SUBI r21, 1
  JMP los_rst

los_px:
  ; Get player position
  LDI r20, 0x4000
  LOAD r16, r20
  ADDI r20, 1
  LOAD r17, r20

  ; Mark player tile visible + ensure it is floor
  MOV r26, r16
  MOV r27, r17
  PUSH r31
  CALL set_visible
  POP r31
  LDI r20, 0x2000
  MOV r18, r17
  SHLI r18, 5
  ADD r20, r18
  ADD r20, r16
  LDI r1, 1
  STORE r20, r1

  ; Iterate tiles within radius 10
  LDI r18, 10
  MOV r19, r18
  NEG r19              ; dy = -10

los_dy:
  CMP r19, r18
  BGE r0, los_fin
  MOV r22, r18
  NEG r22              ; dx = -10

los_dx:
  CMP r22, r18
  BGE r0, los_ndy

  ; Distance check: dx^2 + dy^2 <= 100
  MOV r23, r22
  MUL r23, r23
  MOV r24, r19
  MUL r24, r24
  ADD r23, r24
  LDI r24, 100
  CMP r23, r24
  BGE r0, los_nx

  ; DEBUG: count tiles passing distance check
  LDI r20, 0x6201
  LOAD r25, r20
  ADDI r25, 1
  STORE r20, r25

  ; Target tile: tx = px + dx, ty = py + dy
  MOV r23, r16
  ADD r23, r22
  MOV r24, r17
  ADD r24, r19

  ; Bounds check
  CMPI r23, 0
  BLT r0, los_nx
  CMPI r23, 32
  BGE r0, los_nx
  CMPI r24, 0
  BLT r0, los_nx
  CMPI r24, 32
  BGE r0, los_nx

  ; Skip player tile (dx=0, dy=0)
  JZ r22, los_dy0
  JMP los_not_p
los_dy0:
  JZ r19, los_nx
los_not_p:

  ; Skip if already visible
  LDI r20, 0x3000
  MOV r25, r24
  SHLI r25, 5
  ADD r20, r25
  ADD r20, r23
  LOAD r25, r20
  CMPI r25, 2
  JZ r0, los_nx

  ; Cast Bresenham ray (Bresenham stops at walls internally)
  ; DEBUG: count rays cast
  LDI r20, 0x6200
  LOAD r25, r20
  ADDI r25, 1
  STORE r20, r25
  MOV r4, r16
  MOV r5, r17
  MOV r6, r23
  MOV r7, r24
  PUSH r19
  PUSH r18
  PUSH r16
  PUSH r31
  CALL bresenham_los
  POP r31
  POP r16
  POP r18
  POP r19

los_nx:
  ADDI r22, 1
  JMP los_dx

los_ndy:
  ADDI r19, 1
  JMP los_dy

los_fin:
  RET

; ═══════════════════════════════════════════════════════════
; SET VISIBLE -- mark tile at (r26, r27) as visible
; ═══════════════════════════════════════════════════════════
set_visible:
  LDI r20, 0x3000
  MOV r18, r27
  SHLI r18, 5
  ADD r20, r18
  ADD r20, r26
  LDI r1, 2
  STORE r20, r1
  RET

; ═══════════════════════════════════════════════════════════
; BRESENHAM LOS -- walk from (r4,r5) to (r6,r7), mark visible
; Stops at walls. Preserves r4-r7.
; ═══════════════════════════════════════════════════════════
bresenham_los:
  MOV r8, r4
  MOV r9, r5

  ; dx, dy
  MOV r10, r6
  SUB r10, r4
  MOV r11, r7
  SUB r11, r5

  ; |dx|, |dy|
  MOV r12, r10
  MOV r13, r12
  SARI r13, 31
  XOR r12, r13
  SUB r12, r13

  MOV r14, r11
  MOV r15, r14
  SARI r15, 31
  XOR r14, r15
  SUB r14, r15

  ; Both zero = at target
  JZ r12, bres_at
  JZ r14, bres_at

  ; Sign of dx
  CMPI r10, 0
  JZ r0, bres_sx0
  MOV r13, r10
  SARI r13, 31
  CMPI r13, 0
  JNZ r0, bres_sxn
  LDI r13, 1
  JMP bres_sy
bres_sx0:
  LDI r13, 0
  JMP bres_sy
bres_sxn:
  LDI r13, 0xFFFFFFFF

  ; Sign of dy
bres_sy:
  CMPI r11, 0
  JZ r0, bres_sy0
  MOV r15, r11
  SARI r15, 31
  CMPI r15, 0
  JNZ r0, bres_syn
  LDI r15, 1
  JMP bres_err
bres_sy0:
  LDI r15, 0
  JMP bres_err
bres_syn:
  LDI r15, 0xFFFFFFFF

bres_err:
  MOV r16, r12
  SUB r16, r14

  ; steps = max(adx, ady)
  CMP r12, r14
  BGE r0, bres_sdx
  MOV r17, r14
  JMP bres_lp
bres_sdx:
  MOV r17, r12

bres_lp:
  ; Mark current tile visible
  MOV r26, r8
  MOV r27, r9
  PUSH r31
  CALL set_visible
  POP r31

  ; Check if wall
  LDI r20, 0x2000
  MOV r18, r9
  SHLI r18, 5
  ADD r20, r18
  ADD r20, r8
  LOAD r18, r20
  CMPI r18, 0
  JZ r0, bres_done

  ; At target?
  CMP r8, r6
  JNZ r0, bres_step
  CMP r9, r7
  JZ r0, bres_done
  JMP bres_step

bres_step:
  MOV r18, r16
  SHLI r18, 1

  ; e2 > -ady?
  MOV r19, r14
  NEG r19
  CMP r18, r19
  BLT r0, bres_nox
  ADD r8, r13
  SUB r16, r14
bres_nox:

  ; e2 < adx?
  CMP r18, r12
  BGE r0, bres_noy
  ADD r9, r15
  ADD r16, r12
bres_noy:

  JMP bres_lp

bres_at:
  MOV r26, r8
  MOV r27, r9
  PUSH r31
  CALL set_visible
  POP r31

bres_done:
  RET

; ═══════════════════════════════════════════════════════════
; RENDER MAP -- draw all 32x32 tiles
; ═══════════════════════════════════════════════════════════
render_map:
  LDI r16, 0
rm_y:
  CMPI r16, 32
  BGE r0, rm_done
  LDI r17, 0
rm_x:
  CMPI r17, 32
  BGE r0, rm_ny

  ; Tile index = y*32 + x
  MOV r18, r16
  SHLI r18, 5
  ADD r18, r17

  ; Load tile type
  LDI r20, 0x2000
  ADD r20, r18
  LOAD r19, r20

  ; Load visibility
  LDI r20, 0x3000
  ADD r20, r18
  LOAD r21, r20

  ; Color index = type * 3 + vis
  MOV r22, r19
  LDI r23, 3
  MUL r22, r23
  ADD r22, r21

  ; Lookup color
  LDI r20, 0x6000
  ADD r20, r22
  LOAD r22, r20

  ; Draw 8x8 tile
  MOV r23, r17
  SHLI r23, 3
  MOV r24, r16
  SHLI r24, 3
  LDI r25, 8
  LDI r26, 8
  RECTF r23, r24, r25, r26, r22

  ADDI r17, 1
  JMP rm_x

rm_ny:
  ADDI r16, 1
  JMP rm_y

rm_done:
  RET

; ═══════════════════════════════════════════════════════════
; DRAW ENTITIES -- player + stairs
; ═══════════════════════════════════════════════════════════
draw_entities:
  PUSH r31
  CALL draw_player
  POP r31
  PUSH r31
  CALL draw_stairs
  POP r31
  RET

draw_player:
  LDI r20, 0x4000
  LOAD r4, r20
  ADDI r20, 1
  LOAD r5, r20
  SHLI r4, 3
  SHLI r5, 3
  LDI r6, 8
  LDI r7, 8
  LDI r8, 0x00FF44
  RECTF r4, r5, r6, r7, r8
  RET

draw_stairs:
  LDI r20, 0x6100
  LOAD r4, r20
  ADDI r20, 1
  LOAD r5, r20
  SHLI r4, 3
  SHLI r5, 3
  LDI r6, 8
  LDI r7, 8
  LDI r8, 0xFFAA00
  RECTF r4, r5, r6, r7, r8
  RET

; ═══════════════════════════════════════════════════════════
; HANDLE INPUT -- WASD + R + Q
; ═══════════════════════════════════════════════════════════
handle_input:
  IKEY r10
  JZ r10, inp_done

  ; Load player pos
  LDI r20, 0x4000
  LOAD r4, r20
  ADDI r20, 1
  LOAD r5, r20

  ; W = up
  CMPI r10, 87
  JNZ r0, inp_not_w
  SUBI r5, 1
  PUSH r31
  CALL try_move
  POP r31
  JMP inp_done
inp_not_w:

  ; S = down
  CMPI r10, 83
  JNZ r0, inp_not_s
  ADDI r5, 1
  PUSH r31
  CALL try_move
  POP r31
  JMP inp_done
inp_not_s:

  ; A = left
  CMPI r10, 65
  JNZ r0, inp_not_a
  SUBI r4, 1
  PUSH r31
  CALL try_move
  POP r31
  JMP inp_done
inp_not_a:

  ; D = right
  CMPI r10, 68
  JNZ r0, inp_not_d
  ADDI r4, 1
  PUSH r31
  CALL try_move
  POP r31
  JMP inp_done
inp_not_d:

  ; R = regenerate
  CMPI r10, 82
  JNZ r0, inp_done
  ADDI r29, 1
  JMP new_dungeon

inp_done:
  RET

; ═══════════════════════════════════════════════════════════
; TRY MOVE -- validate and apply player movement
; r4=new_x, r5=new_y
; ═══════════════════════════════════════════════════════════
try_move:
  ; Bounds
  CMPI r4, 32
  BGE r0, tm_fail
  CMPI r5, 32
  BGE r0, tm_fail
  CMPI r4, 0
  BLT r0, tm_fail
  CMPI r5, 0
  BLT r0, tm_fail

  ; Floor check
  LDI r20, 0x2000
  MOV r8, r5
  SHLI r8, 5
  ADD r20, r8
  ADD r20, r4
  LOAD r8, r20
  CMPI r8, 1
  JNZ r0, tm_fail

  ; Apply move
  LDI r20, 0x4000
  STORE r20, r4
  ADDI r20, 1
  STORE r20, r5

  ; Check stairs
  LDI r20, 0x6100
  LOAD r8, r20
  ADDI r20, 1
  LOAD r9, r20
  CMP r4, r8
  JNZ r0, tm_ok
  CMP r5, r9
  JNZ r0, tm_ok
  LDI r20, 0x6102
  LDI r1, 1
  STORE r20, r1

tm_fail:
tm_ok:
  RET
