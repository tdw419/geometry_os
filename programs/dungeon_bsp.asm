; dungeon_bsp.asm -- BSP Dungeon Generator with Fog of War
;
; Controls: WASD/Arrows to move, R to regenerate
;
; Memory layout:
;   0x5000..0x5FFF  map (64x64, u32 each: 0=void 1=wall 2=floor 3=corridor 4=stairs)
;   0x7800         player_x, 0x7801 = player_y
;   0x7900..0x797F explored bits (128 words)
;   0x7A00..0x7A7F visible bits (128 words)
;   0x7B00..0x7B3F bsp_stack (16 entries, 4 words each)
;   0x7B40..0x7B7F rooms (16 entries, 4 words each)
;   0x7B80         bsp_sp
;   0x7B81         room_count
;   0x7B82..0x7B83 stairs_x, stairs_y

; ============================================================
; CONSTANTS - use LDI when needed, r7 = 1 throughout
; ============================================================
restart:
  LDI r7, 1
  CALL init_colors
  CALL clear_explored
  CALL generate_dungeon
  CALL place_player_stairs

game_loop:
  LDI r1, 0
  FILL r1
  CALL compute_visibility
  CALL render_viewport
  CALL draw_player
  CALL draw_hud
  CALL handle_input
  FRAME
  JMP game_loop

; ============================================================
; COLOR TABLE at 0x7C00
; [0] wall_vis [1] floor_vis [2] corr_vis [3] stair_vis
; [4] wall_exp [5] floor_exp [6] corr_exp [7] stair_exp
; ============================================================
init_colors:
  LDI r18, 0x7C00
  LDI r19, 0x556677
  STORE r18, r19
  ADD r18, r7
  LDI r19, 0x887755
  STORE r18, r19
  ADD r18, r7
  LDI r19, 0x557755
  STORE r18, r19
  ADD r18, r7
  LDI r19, 0xFFDD00
  STORE r18, r19
  ADD r18, r7
  LDI r19, 0x2A3344
  STORE r18, r19
  ADD r18, r7
  LDI r19, 0x443A22
  STORE r18, r19
  ADD r18, r7
  LDI r19, 0x2A3A2A
  STORE r18, r19
  ADD r18, r7
  LDI r19, 0x7F6E00
  STORE r18, r19
  RET

clear_explored:
  LDI r18, 0x7900
  LDI r19, 0
  LDI r20, 128
ce_loop:
  STORE r18, r19
  ADD r18, r7
  SUB r20, r7
  JNZ r20, ce_loop
  RET

; ============================================================
; BSP DUNGEON GENERATION
; ============================================================
generate_dungeon:
  PUSH r31

  ; Fill map with walls
  LDI r14, 0
fill_y:
  LDI r15, 0
fill_x:
  MOV r16, r14
  LDI r17, 64
  MUL r16, r17
  ADD r16, r15
  LDI r17, 0x5000
  ADD r16, r17
  LDI r17, 1
  STORE r16, r17
  ADD r15, r7
  LDI r17, 64
  CMP r15, r17
  BLT r0, fill_x
  ADD r14, r7
  LDI r17, 64
  CMP r14, r17
  BLT r0, fill_y

  ; Init BSP stack: push (0, 0, 64, 64)
  LDI r18, 0x7B80
  LDI r19, 0
  STORE r18, r19
  LDI r10, 0
  LDI r11, 0
  LDI r12, 64
  LDI r13, 64
  CALL bsp_push

  ; room_count = 0
  LDI r18, 0x7B81
  LDI r19, 0
  STORE r18, r19

bsp_loop:
  CALL bsp_pop
  JZ r1, bsp_done

  ; Check if leaf: w < 16 AND h < 16
  LDI r17, 16
  CMP r12, r17
  BGE r0, bsp_can_split
  CMP r13, r17
  BGE r0, bsp_can_split
  ; Leaf node - place room
  CALL place_room
  JMP bsp_loop

bsp_can_split:
  ; Decide split direction
  CMP r12, r17
  BGE r0, bsp_w_big
  JMP bsp_h_split
bsp_w_big:
  CMP r13, r17
  BGE r0, bsp_choose
  JMP bsp_v_split
bsp_choose:
  RAND r17
  LDI r18, 1
  AND r17, r18
  JNZ r17, bsp_h_split

bsp_v_split:
  ; Vertical split: split_pos = 10 + RAND % (w - 18)
  ; Clamp: max(1, w - 18)
  MOV r17, r12
  LDI r18, 18
  SUB r17, r18
  LDI r18, 1
  CMP r17, r18
  BGE r0, bsv_ok
  LDI r17, 1
bsv_ok:
  RAND r18
  MOD r18, r17
  LDI r17, 10
  ADD r18, r17
  ; r18 = split_pos

  ; Push right child: (x+sp, y, w-sp, h)
  PUSH r10
  PUSH r11
  PUSH r12
  PUSH r13
  ADD r10, r18
  SUB r12, r18
  CALL bsp_push
  POP r13
  POP r12
  POP r11
  POP r10

  ; Push left child: (x, y, sp, h)
  PUSH r13
  MOV r13, r18
  CALL bsp_push
  POP r13
  JMP bsp_loop

bsp_h_split:
  ; Horizontal split: split_pos = 10 + RAND % (h - 18)
  MOV r17, r13
  LDI r18, 18
  SUB r17, r18
  LDI r18, 1
  CMP r17, r18
  BGE r0, bsh_ok
  LDI r17, 1
bsh_ok:
  RAND r18
  MOD r18, r17
  LDI r17, 10
  ADD r18, r17

  ; Push bottom: (x, y+sp, w, h-sp)
  PUSH r10
  PUSH r11
  PUSH r12
  PUSH r13
  ADD r11, r18
  SUB r13, r18
  CALL bsp_push
  POP r13
  POP r12
  POP r11
  POP r10

  ; Push top: (x, y, w, sp)
  PUSH r12
  MOV r12, r18
  CALL bsp_push
  POP r12
  JMP bsp_loop

bsp_done:
  CALL connect_rooms
  POP r31
  RET

; ============================================================
; BSP STACK (r7 must = 1)
; ============================================================
bsp_push:
  LDI r18, 0x7B80
  LOAD r19, r18
  LDI r20, 0x7B00
  LDI r21, 4
  MOV r22, r19
  MUL r22, r21
  ADD r20, r22
  STORE r20, r10
  ADD r20, r21
  STORE r20, r11
  ADD r20, r21
  STORE r20, r12
  ADD r20, r21
  STORE r20, r13
  ADD r19, r7
  STORE r18, r19
  RET

; bsp_pop: pop into r10..r13, r1=1 success or r1=0 empty
bsp_pop:
  LDI r18, 0x7B80
  LOAD r19, r18
  JZ r19, pop_empty
  SUB r19, r7
  LDI r20, 0x7B00
  LDI r21, 4
  MOV r22, r19
  MUL r22, r21
  LOAD r10, r20
  ADD r20, r21
  LOAD r11, r20
  ADD r20, r21
  LOAD r12, r20
  ADD r20, r21
  LOAD r13, r20
  STORE r18, r19
  LDI r1, 1
  RET
pop_empty:
  LDI r1, 0
  RET

; ============================================================
; PLACE ROOM IN LEAF (r10=lx, r11=ly, r12=lw, r13=lh)
; ============================================================
place_room:
  PUSH r31

  ; room_w = 4 + RAND % min(lw-2, 8)  clamped to [4, lw-2]
  MOV r14, r12
  LDI r15, 2
  SUB r14, r15
  LDI r15, 4
  CMP r14, r15
  BGE r0, prw_ok
  ; lw-2 < 4: room_w = lw - 2 (minimum viable)
  MOV r17, r14
  JMP prw_have
prw_ok:
  LDI r15, 8
  CMP r14, r15
  BLT r0, prw_range
  LDI r14, 8
prw_range:
  RAND r17
  MOD r17, r14
  LDI r15, 4
  ADD r17, r15
prw_have:

  ; room_h = 4 + RAND % min(lh-2, 8)
  MOV r14, r13
  LDI r15, 2
  SUB r14, r15
  LDI r15, 4
  CMP r14, r15
  BGE r0, prh_ok
  MOV r18, r14
  JMP prh_have
prh_ok:
  LDI r15, 8
  CMP r14, r15
  BLT r0, prh_range
  LDI r14, 8
prh_range:
  RAND r18
  MOD r18, r14
  LDI r15, 4
  ADD r18, r15
prh_have:

  ; room_x = lx + 1 + RAND % max(1, lw - rw - 1)
  MOV r14, r12
  SUB r14, r17
  LDI r15, 1
  SUB r14, r15
  LDI r15, 1
  CMP r14, r15
  BGE r0, prx_ok
  LDI r14, 1
prx_ok:
  RAND r19
  MOD r19, r14
  LDI r15, 1
  ADD r19, r15
  ADD r19, r10

  ; room_y = ly + 1 + RAND % max(1, lh - rh - 1)
  MOV r14, r13
  SUB r14, r18
  LDI r15, 1
  SUB r14, r15
  LDI r15, 1
  CMP r14, r15
  BGE r0, pry_ok
  LDI r14, 1
pry_ok:
  RAND r20
  MOD r20, r14
  LDI r15, 1
  ADD r20, r15
  ADD r20, r11

  ; r19=rx, r20=ry, r17=rw, r18=rh -> carve floor (2) into map
  MOV r22, r20
pr_cy:
  MOV r24, r19
pr_cx:
  MOV r25, r22
  LDI r26, 64
  MUL r25, r26
  ADD r25, r24
  LDI r26, 0x5000
  ADD r25, r26
  LDI r26, 2
  STORE r25, r26
  ADD r24, r7
  MOV r25, r19
  ADD r25, r17
  CMP r24, r25
  BLT r0, pr_cx
  ADD r22, r7
  MOV r25, r20
  ADD r25, r18
  CMP r22, r25
  BLT r0, pr_cy

  ; Store room: rooms[room_count] = (rx, ry, rw, rh)
  LDI r22, 0x7B81
  LOAD r23, r22
  LDI r24, 4
  MOV r25, r23
  MUL r25, r24
  LDI r26, 0x7B40
  ADD r26, r25
  STORE r26, r19
  ADD r26, r24
  STORE r26, r20
  ADD r26, r24
  STORE r26, r17
  ADD r26, r24
  STORE r26, r18
  ADD r23, r7
  STORE r22, r23

  POP r31
  RET

; ============================================================
; CONNECT ROOMS WITH CORRIDORS
; ============================================================
connect_rooms:
  PUSH r31
  LDI r18, 0x7B81
  LOAD r19, r18
  JZ r19, conn_done
  LDI r20, 0
conn_i:
  CMP r20, r19
  BGE r0, conn_done
  MOV r21, r20
  ADD r21, r7
  CMP r21, r19
  BGE r0, conn_next

  ; Room i center
  LDI r22, 4
  MOV r23, r20
  MUL r23, r22
  LDI r24, 0x7B40
  ADD r24, r23
  LOAD r10, r24
  ADD r24, r22
  LOAD r11, r24
  ADD r24, r22
  LOAD r12, r24
  ADD r24, r22
  LOAD r13, r24
  LDI r14, 2
  SHR r12, r14
  SHR r13, r14
  ADD r10, r12
  ADD r11, r13
  ; r10 = ax, r11 = ay (center of room i)

  ; Room i+1 center
  MOV r23, r21
  MUL r23, r22
  LDI r24, 0x7B40
  ADD r24, r23
  LOAD r16, r24
  ADD r24, r22
  LOAD r17, r24
  ADD r24, r22
  LOAD r1, r24
  ADD r24, r22
  LOAD r2, r24
  LDI r14, 2
  SHR r1, r14
  SHR r2, r14
  ADD r16, r1
  ADD r17, r2
  ; r16 = bx, r17 = by (center of room i+1)

  ; H then V or V then H
  RAND r23
  LDI r24, 1
  AND r23, r24
  JNZ r23, conn_vh

  ; Horizontal then vertical
  CALL carve_h_corr
  CALL carve_v_corr
  JMP conn_next
conn_vh:
  CALL carve_v_corr
  CALL carve_h_corr

conn_next:
  ADD r20, r7
  JMP conn_i
conn_done:
  POP r31
  RET

; Carve horizontal corridor at r11(ay) from r10(ax) to r16(bx)
carve_h_corr:
  PUSH r31
  CMP r10, r16
  BLT r0, chc_ok
  MOV r25, r10
  MOV r10, r16
  MOV r16, r25
chc_ok:
  LDI r23, 0x5000
chc_l:
  MOV r24, r11
  LDI r25, 64
  MUL r24, r25
  ADD r24, r10
  ADD r24, r23
  LDI r25, 1
  CMP r10, r16
  BGE r0, chc_end
  LOAD r26, r24
  LDI r27, 2
  CMP r26, r27
  BGE r0, chc_skip
  LDI r26, 3
  STORE r24, r26
chc_skip:
  ADD r10, r7
  JMP chc_l
chc_end:
  ; Also carve endpoint
  MOV r24, r11
  LDI r25, 64
  MUL r24, r25
  ADD r24, r16
  ADD r24, r23
  LOAD r26, r24
  LDI r27, 2
  CMP r26, r27
  BGE r0, chc_done
  LDI r26, 3
  STORE r24, r26
chc_done:
  POP r31
  RET

; Carve vertical corridor at r10(ax) from r11(ay) to r17(by)
carve_v_corr:
  PUSH r31
  CMP r11, r17
  BLT r0, cvc_ok
  MOV r25, r11
  MOV r11, r17
  MOV r17, r25
cvc_ok:
  LDI r23, 0x5000
cvc_l:
  MOV r24, r11
  LDI r25, 64
  MUL r24, r25
  ADD r24, r10
  ADD r24, r23
  CMP r11, r17
  BGE r0, cvc_end
  LOAD r26, r24
  LDI r27, 2
  CMP r26, r27
  BGE r0, cvc_skip
  LDI r26, 3
  STORE r24, r26
cvc_skip:
  ADD r11, r7
  JMP cvc_l
cvc_end:
  MOV r24, r17
  LDI r25, 64
  MUL r24, r25
  ADD r24, r10
  ADD r24, r23
  LOAD r26, r24
  LDI r27, 2
  CMP r26, r27
  BGE r0, cvc_done
  LDI r26, 3
  STORE r24, r26
cvc_done:
  POP r31
  RET

; ============================================================
; PLACE PLAYER AND STAIRS
; ============================================================
place_player_stairs:
  PUSH r31
  ; Player at center of room 0
  LDI r18, 0x7B40
  LOAD r10, r18
  ADD r18, r7
  LOAD r11, r18
  ADD r18, r7
  LOAD r12, r18
  ADD r18, r7
  LOAD r13, r18
  LDI r14, 2
  SHR r12, r14
  SHR r13, r14
  ADD r10, r12
  ADD r11, r13
  LDI r18, 0x7800
  STORE r18, r10
  ADD r18, r7
  STORE r18, r11

  ; Stairs at center of last room
  LDI r18, 0x7B81
  LOAD r19, r18
  LDI r20, 1
  SUB r19, r20
  LDI r21, 4
  MOV r22, r19
  MUL r22, r21
  LDI r18, 0x7B40
  ADD r18, r22
  LOAD r10, r18
  ADD r18, r21
  LOAD r11, r18
  ADD r18, r21
  LOAD r12, r18
  ADD r18, r21
  LOAD r13, r18
  LDI r14, 2
  SHR r12, r14
  SHR r13, r14
  ADD r10, r12
  ADD r11, r13
  LDI r18, 0x7B82
  STORE r18, r10
  ADD r18, r7
  STORE r18, r11
  ; Mark stairs on map
  MOV r14, r11
  LDI r15, 64
  MUL r14, r15
  ADD r14, r10
  LDI r15, 0x5000
  ADD r14, r15
  LDI r15, 4
  STORE r14, r15

  POP r31
  RET

; ============================================================
; BIT ARRAY HELPERS (r7 = 1)
; set_bit(r10=array_base, r11=tx, r12=ty)
; ============================================================
set_bit:
  MOV r13, r12
  LDI r14, 64
  MUL r13, r14
  ADD r13, r11
  LDI r14, 5
  MOV r15, r13
  SHR r15, r14
  LDI r14, 31
  AND r16, r13
  LDI r14, 1
  MOV r17, r16
  SHL r17, r14
  MOV r18, r10
  ADD r18, r15
  LOAD r19, r18
  OR r19, r17
  STORE r18, r19
  RET

; ============================================================
; COMPUTE VISIBILITY
; Cast rays in a 17x17 grid (radius 8) around player
; ============================================================
compute_visibility:
  PUSH r31

  ; Clear visible array
  LDI r18, 0x7A00
  LDI r19, 0
  LDI r20, 128
cv_cl:
  STORE r18, r19
  ADD r18, r7
  SUB r20, r7
  JNZ r20, cv_cl

  ; Load player pos
  LDI r18, 0x7800
  LOAD r22, r18
  ADD r18, r7
  LOAD r23, r18

  ; Mark player tile visible+explored
  LDI r10, 0x7A00
  MOV r11, r22
  MOV r12, r23
  CALL set_bit
  LDI r10, 0x7900
  CALL set_bit

  ; Iterate 17x17 grid
  LDI r24, 0
cv_y:
  LDI r25, 0
cv_x:
  ; Skip (0,0)
  JNZ r24, cvx_nz
  JNZ r25, cvx_nz
  JMP cvx_next
cvx_nz:

  ; Distance check: |dx|^2 + |dy|^2 <= 64
  ; dx = r25 - 8, dy = r24 - 8
  ; |dx|: if r25 < 8 then 8-r25 else r25-8
  MOV r26, r25
  LDI r27, 8
  CMP r26, r27
  BGE r0, cvx_dxb
  LDI r26, 8
  SUB r26, r25
  JMP cvx_dxd
cvx_dxb:
  SUB r26, r27
cvx_dxd:
  MOV r27, r24
  LDI r28, 8
  CMP r27, r28
  BGE r0, cvx_dyb
  LDI r27, 8
  SUB r27, r24
  JMP cvx_dyd
cvx_dyb:
  SUB r27, r28
cvx_dyd:
  MUL r26, r26
  MUL r27, r27
  ADD r26, r27
  LDI r27, 65
  CMP r26, r27
  BGE r0, cvx_next

  ; Target tile: tx = px + signed(r25-8), ty = py + signed(r24-8)
  ; Signed add: if index < 8, subtract (8-index); if > 8, add (index-8)
  MOV r26, r22
  MOV r27, r25
  LDI r28, 8
  CMP r27, r28
  BGE r0, cvx_txa
  SUB r28, r27
  SUB r26, r28
  JMP cvx_txd
cvx_txa:
  JZ r27, cvx_txd
  SUB r27, r28
  ADD r26, r27
cvx_txd:
  MOV r16, r26

  MOV r26, r23
  MOV r27, r24
  LDI r28, 8
  CMP r27, r28
  BGE r0, cvx_tya
  SUB r28, r27
  SUB r26, r28
  JMP cvx_tyd
cvx_tya:
  JZ r27, cvx_tyd
  SUB r27, r28
  ADD r26, r27
cvx_tyd:
  MOV r17, r26

  ; Bounds check: tx < 64, ty < 64
  LDI r26, 64
  CMP r16, r26
  BGE r0, cvx_next
  CMP r17, r26
  BGE r0, cvx_next

  ; LOS check (Bresenham from player to target)
  PUSH r31
  CALL check_los
  JZ r1, cvx_nx
  ; Clear LOS: mark visible+explored
  LDI r10, 0x7A00
  MOV r11, r16
  MOV r12, r17
  CALL set_bit
  LDI r10, 0x7900
  CALL set_bit
cvx_nx:
  POP r31

cvx_next:
  ADD r25, r7
  LDI r26, 17
  CMP r25, r26
  BLT r0, cv_x
  ADD r24, r7
  LDI r26, 17
  CMP r24, r26
  BLT r0, cv_y

  POP r31
  RET

; ============================================================
; LINE OF SIGHT (Bresenham from px,py to tx,ty)
; Input: r22=px, r23=py, r16=tx, r17=ty
; Output: r1 = 1 (clear) or 0 (wall hit)
; Side effect: marks wall as visible+explored
; ============================================================
check_los:
  PUSH r31
  PUSH r10
  PUSH r11

  ; dx = |tx - px|, step_x = +1 or -1 or 0
  CMP r16, r22
  BGE r0, los_dxp
  MOV r20, r22
  SUB r20, r16
  LDI r21, 0xFFFFFFFF
  JMP los_dyd
los_dxp:
  JZ r0, los_dxz
  MOV r20, r16
  SUB r20, r22
  LDI r21, 1
  JMP los_dyd
los_dxz:
  LDI r20, 0
  LDI r21, 0

  ; dy = |ty - py|, step_y
los_dyd:
  CMP r17, r23
  BGE r0, los_dyp
  MOV r26, r23
  SUB r26, r17
  LDI r27, 0xFFFFFFFF
  JMP los_start
los_dyp:
  JZ r0, los_dyz
  MOV r26, r17
  SUB r26, r23
  LDI r27, 1
  JMP los_start
los_dyz:
  LDI r26, 0
  LDI r27, 0

los_start:
  ; Bresenham line stepping
  ; err = 0, cx = px, cy = py
  MOV r18, r22
  MOV r19, r23
  LDI r28, 0
  ; r29 = 2*abs_dx, r1 = 2*abs_dy (careful with r1)
  MOV r29, r20
  SHL r29, r7
  MOV r14, r26
  SHL r14, r7

  ; Check which axis is dominant
  CMP r20, r26
  BGE r0, los_steep

los_shallow:
  ADD r18, r21
  ADD r28, r14
  CMP r28, r20
  BLT r0, los_s_chk
  SUB r28, r29
  ADD r19, r27
los_s_chk:
  ; Arrived?
  CMP r18, r16
  JZ r0, los_s_yok
  CMP r19, r17
  JZ r0, los_s_clear
  JMP los_s_wall
los_s_yok:
  CMP r19, r17
  JZ r0, los_s_clear

los_s_wall:
  ; Bounds
  LDI r2, 64
  CMP r18, r2
  BGE r0, los_s_clear
  CMP r19, r2
  BGE r0, los_s_clear
  ; Check tile
  MOV r2, r19
  LDI r3, 64
  MUL r2, r3
  ADD r2, r18
  LDI r3, 0x5000
  ADD r2, r3
  LOAD r2, r2
  LDI r3, 1
  CMP r2, r3
  JZ r0, los_wall_hit
  ; Step limit
  PUSH r20
  PUSH r26
  ADD r20, r26
  LDI r3, 30
  CMP r20, r3
  POP r26
  POP r20
  BGE r0, los_s_clear
  JMP los_shallow

los_steep:
  ADD r19, r27
  ADD r28, r29
  CMP r28, r26
  BLT r0, los_t_chk
  SUB r28, r14
  ADD r18, r21
los_t_chk:
  CMP r18, r16
  JZ r0, los_t_yok
  CMP r19, r17
  JZ r0, los_t_clear
  JMP los_t_wall
los_t_yok:
  CMP r19, r17
  JZ r0, los_t_clear

los_t_wall:
  LDI r2, 64
  CMP r18, r2
  BGE r0, los_t_clear
  CMP r19, r2
  BGE r0, los_t_clear
  MOV r2, r19
  LDI r3, 64
  MUL r2, r3
  ADD r2, r18
  LDI r3, 0x5000
  ADD r2, r3
  LOAD r2, r2
  LDI r3, 1
  CMP r2, r3
  JZ r0, los_wall_hit
  PUSH r20
  PUSH r26
  ADD r20, r26
  LDI r3, 30
  CMP r20, r3
  POP r26
  POP r20
  BGE r0, los_t_clear
  JMP los_steep

los_wall_hit:
  ; Mark wall visible+explored
  LDI r10, 0x7A00
  MOV r11, r18
  MOV r12, r19
  CALL set_bit
  LDI r10, 0x7900
  CALL set_bit
  LDI r1, 0
  JMP los_exit

los_s_clear:
los_t_clear:
  LDI r1, 1

los_exit:
  POP r11
  POP r10
  POP r31
  RET

; ============================================================
; RENDER 32x32 VIEWPORT
; ============================================================
render_viewport:
  PUSH r31

  LDI r18, 0x7800
  LOAD r22, r18
  ADD r18, r7
  LOAD r23, r18

  ; cam_x = clamp(px-16, 0, 32)
  MOV r20, r22
  LDI r21, 16
  SUB r20, r21
  LDI r21, 0
  CMP r20, r21
  BGE r0, rv_cx1
  LDI r20, 0
rv_cx1:
  LDI r21, 32
  CMP r20, r21
  BLT r0, rv_cx2
  LDI r20, 32
rv_cx2:
  ; cam_y = clamp(py-16, 0, 32)
  MOV r21, r23
  LDI r14, 16
  SUB r21, r14
  LDI r14, 0
  CMP r21, r14
  BGE r0, rv_cy1
  LDI r21, 0
rv_cy1:
  LDI r14, 32
  CMP r21, r14
  BLT r0, rv_cy2
  LDI r21, 32
rv_cy2:

  LDI r24, 0
rv_y:
  LDI r25, 0
rv_x:
  ; mx = cam_x + vx, my = cam_y + vy
  MOV r13, r20
  ADD r13, r25
  MOV r14, r21
  ADD r14, r24

  ; Load tile
  MOV r1, r14
  LDI r2, 64
  MUL r1, r2
  ADD r1, r13
  LDI r2, 0x5000
  ADD r1, r2
  LOAD r3, r1
  JZ r3, rv_skip

  ; Check explored: bit_index = my*64 + mx
  MOV r4, r14
  LDI r2, 64
  MUL r4, r2
  ADD r4, r13
  LDI r2, 5
  MOV r5, r4
  SHR r5, r2
  LDI r2, 31
  AND r6, r4
  LDI r2, 1
  MOV r8, r6
  SHL r8, r2
  ; Load explored word
  LDI r9, 0x7900
  ADD r9, r5
  LOAD r9, r9
  AND r9, r8
  JZ r9, rv_skip

  ; Check visible
  LDI r9, 0x7A00
  ADD r9, r5
  LOAD r9, r9
  AND r9, r8
  JNZ r9, rv_vis

  ; Explored only: dim color (table[tile-1+4])
  MOV r6, r3
  LDI r2, 1
  SUB r6, r2
  LDI r2, 4
  ADD r6, r2
  JMP rv_color

rv_vis:
  MOV r6, r3
  LDI r2, 1
  SUB r6, r2

rv_color:
  LDI r2, 0x7C00
  ADD r2, r6
  LOAD r2, r2

  ; screen_x = 64 + vx * 4
  MOV r8, r25
  LDI r9, 4
  MUL r8, r9
  LDI r9, 64
  ADD r8, r9
  ; screen_y = 64 + vy * 4
  MOV r9, r24
  LDI r3, 4
  MUL r9, r3
  LDI r3, 64
  ADD r9, r3
  LDI r4, 4
  RECTF r8, r9, r4, r4, r2

rv_skip:
  ADD r25, r7
  LDI r2, 32
  CMP r25, r2
  BLT r0, rv_x
  ADD r24, r7
  LDI r2, 32
  CMP r24, r2
  BLT r0, rv_y

  POP r31
  RET

; ============================================================
; DRAW PLAYER
; ============================================================
draw_player:
  PUSH r31
  LDI r18, 0x7800
  LOAD r10, r18
  ADD r18, r7
  LOAD r11, r18

  ; cam
  MOV r12, r10
  LDI r13, 16
  SUB r12, r13
  LDI r14, 0
  CMP r12, r14
  BGE r0, dp_cx1
  LDI r12, 0
dp_cx1:
  LDI r14, 32
  CMP r12, r14
  BLT r0, dp_cx2
  LDI r12, 32
dp_cx2:
  MOV r13, r11
  LDI r14, 16
  SUB r13, r14
  LDI r14, 0
  CMP r13, r14
  BGE r0, dp_cy1
  LDI r13, 0
dp_cy1:
  LDI r14, 32
  CMP r13, r14
  BLT r0, dp_cy2
  LDI r13, 32
dp_cy2:

  SUB r10, r12
  LDI r14, 4
  MUL r10, r14
  LDI r14, 64
  ADD r10, r14
  SUB r11, r13
  LDI r14, 4
  MUL r11, r14
  LDI r14, 64
  ADD r11, r14

  LDI r12, 0x00FF44
  LDI r13, 4
  RECTF r10, r11, r13, r13, r12
  POP r31
  RET

; ============================================================
; DRAW HUD
; ============================================================
draw_hud:
  PUSH r31

  ; Top bar
  LDI r1, 0
  LDI r2, 0
  LDI r3, 256
  LDI r4, 8
  LDI r5, 0x181818
  RECTF r1, r2, r3, r4, r5

  ; Bottom bar
  LDI r2, 248
  RECTF r1, r2, r3, r4, r5

  ; HUD text stored at 0x7D00
  ; "BSP DUNGEON" at 0x7D00
  LDI r18, 0x7D00
  LDI r19, 66
  STORE r18, r19
  ADD r18, r7
  LDI r19, 83
  STORE r18, r19
  ADD r18, r7
  LDI r19, 80
  STORE r18, r19
  ADD r18, r7
  LDI r19, 32
  STORE r18, r19
  ADD r18, r7
  LDI r19, 68
  STORE r18, r19
  ADD r18, r7
  LDI r19, 85
  STORE r18, r19
  ADD r18, r7
  LDI r19, 78
  STORE r18, r19
  ADD r18, r7
  LDI r19, 71
  STORE r18, r19
  ADD r18, r7
  LDI r19, 69
  STORE r18, r19
  ADD r18, r7
  LDI r19, 79
  STORE r18, r19
  ADD r18, r7
  LDI r19, 78
  STORE r18, r19
  ADD r18, r7
  LDI r19, 0
  STORE r18, r19

  ; "WASD Move R New" at 0x7D20
  LDI r18, 0x7D20
  LDI r19, 87
  STORE r18, r19
  ADD r18, r7
  LDI r19, 65
  STORE r18, r19
  ADD r18, r7
  LDI r19, 83
  STORE r18, r19
  ADD r18, r7
  LDI r19, 68
  STORE r18, r19
  ADD r18, r7
  LDI r19, 58
  STORE r18, r19
  ADD r18, r7
  LDI r19, 77
  STORE r18, r19
  ADD r18, r7
  LDI r19, 111
  STORE r18, r19
  ADD r18, r7
  LDI r19, 118
  STORE r18, r19
  ADD r18, r7
  LDI r19, 101
  STORE r18, r19
  ADD r18, r7
  LDI r19, 32
  STORE r18, r19
  ADD r18, r7
  LDI r19, 82
  STORE r18, r19
  ADD r18, r7
  LDI r19, 58
  STORE r18, r19
  ADD r18, r7
  LDI r19, 78
  STORE r18, r19
  ADD r18, r7
  LDI r19, 101
  STORE r18, r19
  ADD r18, r7
  LDI r19, 119
  STORE r18, r19
  ADD r18, r7
  LDI r19, 0
  STORE r18, r19

  ; "Fog of War" at 0x7D40
  LDI r18, 0x7D40
  LDI r19, 70
  STORE r18, r19
  ADD r18, r7
  LDI r19, 111
  STORE r18, r19
  ADD r18, r7
  LDI r19, 103
  STORE r18, r19
  ADD r18, r7
  LDI r19, 32
  STORE r18, r19
  ADD r18, r7
  LDI r19, 111
  STORE r18, r19
  ADD r18, r7
  LDI r19, 102
  STORE r18, r19
  ADD r18, r7
  LDI r19, 32
  STORE r18, r19
  ADD r18, r7
  LDI r19, 87
  STORE r18, r19
  ADD r18, r7
  LDI r19, 97
  STORE r18, r19
  ADD r18, r7
  LDI r19, 114
  STORE r18, r19
  ADD r18, r7
  LDI r19, 0
  STORE r18, r19

  ; Render text
  LDI r1, 4
  LDI r2, 0
  LDI r3, 0x7D00
  TEXT r1, r2, r3
  LDI r2, 248
  LDI r3, 0x7D20
  TEXT r1, r2, r3
  LDI r1, 160
  LDI r2, 0
  LDI r3, 0x7D40
  TEXT r1, r2, r3

  ; Room count bar
  LDI r18, 0x7B81
  LOAD r19, r18
  LDI r20, 2
  MUL r19, r20
  LDI r1, 160
  LDI r2, 10
  LDI r4, 4
  LDI r5, 0x556655
  RECTF r1, r2, r19, r4, r5

  POP r31
  RET

; ============================================================
; INPUT HANDLING
; ============================================================
handle_input:
  PUSH r31
  IKEY r7
  JZ r7, hi_done

  ; W/w/Up
  LDI r8, 87
  CMP r7, r8
  JZ r0, hi_up
  LDI r8, 119
  CMP r7, r8
  JZ r0, hi_up
  ; S/s/Down
  LDI r8, 83
  CMP r7, r8
  JZ r0, hi_down
  LDI r8, 115
  CMP r7, r8
  JZ r0, hi_down
  ; A/a/Left
  LDI r8, 65
  CMP r7, r8
  JZ r0, hi_left
  LDI r8, 97
  CMP r7, r8
  JZ r0, hi_left
  ; D/d/Right
  LDI r8, 68
  CMP r7, r8
  JZ r0, hi_right
  LDI r8, 100
  CMP r7, r8
  JZ r0, hi_right
  ; R/r - restart
  LDI r8, 82
  CMP r7, r8
  JZ r0, hi_restart
  LDI r8, 114
  CMP r7, r8
  JZ r0, hi_restart
  JMP hi_done

hi_up:
  LDI r18, 0x7801
  LOAD r19, r18
  JZ r19, hi_done
  SUB r19, r7
  LDI r18, 0x7800
  LOAD r20, r18
  MOV r21, r19
  CALL is_walk
  JZ r1, hi_done
  LDI r18, 0x7801
  STORE r18, r19
  JMP hi_done

hi_down:
  LDI r18, 0x7801
  LOAD r19, r18
  LDI r20, 63
  CMP r19, r20
  BGE r0, hi_done
  ADD r19, r7
  LDI r18, 0x7800
  LOAD r20, r18
  MOV r21, r19
  CALL is_walk
  JZ r1, hi_done
  LDI r18, 0x7801
  STORE r18, r19
  JMP hi_done

hi_left:
  LDI r18, 0x7800
  LOAD r19, r18
  JZ r19, hi_done
  SUB r19, r7
  LDI r18, 0x7801
  LOAD r21, r18
  MOV r20, r19
  CALL is_walk
  JZ r1, hi_done
  LDI r18, 0x7800
  STORE r18, r19
  JMP hi_done

hi_right:
  LDI r18, 0x7800
  LOAD r19, r18
  LDI r20, 63
  CMP r19, r20
  BGE r0, hi_done
  ADD r19, r7
  LDI r18, 0x7801
  LOAD r21, r18
  MOV r20, r19
  CALL is_walk
  JZ r1, hi_done
  LDI r18, 0x7800
  STORE r18, r19
  JMP hi_done

hi_restart:
  CALL clear_explored
  CALL generate_dungeon
  CALL place_player_stairs

hi_done:
  LDI r7, 1
  POP r31
  RET

; is_walk(r20=tx, r21=ty): r1=1 if walkable (tile>=2), 0 if not
is_walk:
  MOV r22, r21
  LDI r23, 64
  MUL r22, r23
  ADD r22, r20
  LDI r23, 0x5000
  ADD r22, r23
  LOAD r22, r22
  LDI r23, 2
  CMP r22, r23
  BGE r0, iw_yes
  LDI r1, 0
  RET
iw_yes:
  LDI r1, 1
  RET
