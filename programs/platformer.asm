; platformer.asm -- Side-scrolling platformer with physics
;
; Controls: A/D=move, W/Space=jump, R=restart
;
; Memory layout:
;   0x2000-0x21FF  Level tiles (512, 32x16, type per word)
;     type: 0=air 1=ground 2=platform 3=coin
;   0x3000-0x3009  Player (px py vx vy on_ground score state death_t cam_x)
;   0x3200-0x3207  Enemy 0 (ex ey evx etype alive espd elen estart)
;   0x3220-0x3227  Enemy 1
;   0x5000-0x50FF  Text buffer

; ═══════════════════════════════════════════════════════════════════
; ENTRY
; ═══════════════════════════════════════════════════════════════════
restart:
  LDI r30, 0xFE00
  PUSH r31
  CALL init_level
  POP r31
  PUSH r31
  CALL init_enemies
  POP r31
  PUSH r31
  CALL init_player
  POP r31
  JMP main_loop

; ═══════════════════════════════════════════════════════════════════
; INIT LEVEL -- 32x16 tile grid, 16px per tile
; ═══════════════════════════════════════════════════════════════════
init_level:
  ; rows 0-11 = air (384 tiles)
  LDI r4, 0x2000
  LDI r1, 0
  LDI r9, 384
il_air:
  STORE r4, r1
  ADDI r4, 1
  SUBI r9, 1
  JNZ r9, il_air

  ; row 12 (y=192): platforms at cols 5-7, 14-16, 23-25
  ; coins at cols 6, 15, 24
  ; first fill row 12 with air
  LDI r4, 0x2000
  ADDI r4, 384
  LDI r9, 32
il_r12air:
  LDI r1, 0
  STORE r4, r1
  ADDI r4, 1
  SUBI r9, 1
  JNZ r9, il_r12air
  ; platforms
  LDI r4, 0x2000
  ADDI r4, 389
  LDI r1, 2
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1
  LDI r4, 0x2000
  ADDI r4, 398
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1
  LDI r4, 0x2000
  ADDI r4, 407
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1
  ; coins above platforms (row 11)
  LDI r1, 3
  LDI r4, 0x2000
  ADDI r4, 358
  STORE r4, r1
  LDI r4, 0x2000
  ADDI r4, 367
  STORE r4, r1
  LDI r4, 0x2000
  ADDI r4, 376
  STORE r4, r1
  ; coins on ground level (row 12, cols 3, 9, 10, 17, 21)
  LDI r4, 0x2000
  ADDI r4, 387
  STORE r4, r1
  LDI r4, 0x2000
  ADDI r4, 393
  STORE r4, r1
  LDI r4, 0x2000
  ADDI r4, 394
  STORE r4, r1
  LDI r4, 0x2000
  ADDI r4, 401
  STORE r4, r1
  LDI r4, 0x2000
  ADDI r4, 405
  STORE r4, r1

  ; row 13 (y=208): ground with gaps
  LDI r4, 0x2000
  ADDI r4, 416
  LDI r1, 1
  LDI r9, 8
il_g13a:
  STORE r4, r1
  ADDI r4, 1
  SUBI r9, 1
  JNZ r9, il_g13a
  LDI r1, 0
  LDI r9, 4
il_gap13a:
  STORE r4, r1
  ADDI r4, 1
  SUBI r9, 1
  JNZ r9, il_gap13a
  LDI r1, 1
  LDI r9, 8
il_g13b:
  STORE r4, r1
  ADDI r4, 1
  SUBI r9, 1
  JNZ r9, il_g13b
  LDI r1, 0
  LDI r9, 4
il_gap13b:
  STORE r4, r1
  ADDI r4, 1
  SUBI r9, 1
  JNZ r9, il_gap13b
  LDI r1, 1
  LDI r9, 8
il_g13c:
  STORE r4, r1
  ADDI r4, 1
  SUBI r9, 1
  JNZ r9, il_g13c

  ; rows 14-15 (y=224, 240): solid ground
  LDI r9, 64
il_gnd_bot:
  STORE r4, r1
  ADDI r4, 1
  SUBI r9, 1
  JNZ r9, il_gnd_bot

  RET

; ═══════════════════════════════════════════════════════════════════
; INIT ENEMIES
; ═══════════════════════════════════════════════════════════════════
init_enemies:
  ; enemy 0 at 0x3200: patrols cols 2-7 (x 32..127)
  LDI r4, 0x3200
  LDI r1, 64
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 192
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 1
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 96
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 32
  STORE r4, r1
  ; enemy 1 at 0x3220: patrols cols 14-19 (x 224..319)
  LDI r4, 0x3220
  LDI r1, 256
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 192
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 1
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 96
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 224
  STORE r4, r1
  RET

; ═══════════════════════════════════════════════════════════════════
; INIT PLAYER
; ═══════════════════════════════════════════════════════════════════
init_player:
  LDI r4, 0x3000
  LDI r1, 50
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 170
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r1
  RET

; ═══════════════════════════════════════════════════════════════════
; GET TILE -- r10=world_x r11=world_y -> r12=tile_type
; ═══════════════════════════════════════════════════════════════════
get_tile:
  MOV r13, r10
  LDI r14, 4
  SHR r13, r14
  MOV r14, r11
  LDI r15, 4
  SHR r14, r15
  LDI r15, 31
  CMP r13, r15
  BLT r0, gt_ok
  MOV r13, r15
gt_ok:
  LDI r15, 32
  MUL r14, r15
  ADD r14, r13
  LDI r15, 0x2000
  ADD r15, r14
  LOAD r12, r15
  RET

; ═══════════════════════════════════════════════════════════════════
; CHECK SOLID -- r10=x r11=y -> r12=1 if ground/platform
; ═══════════════════════════════════════════════════════════════════
check_solid:
  PUSH r31
  CALL get_tile
  LDI r13, 1
  CMP r12, r13
  JZ r0, cs_yes
  LDI r13, 2
  CMP r12, r13
  JZ r0, cs_yes
  LDI r12, 0
  POP r31
  RET
cs_yes:
  LDI r12, 1
  POP r31
  RET

; ═══════════════════════════════════════════════════════════════════
; UPDATE PLAYER
; ═══════════════════════════════════════════════════════════════════
update_player:
  PUSH r31
  LDI r4, 0x3000
  LOAD r10, r4
  ADDI r4, 1
  LOAD r11, r4
  ADDI r4, 1
  LOAD r12, r4
  ADDI r4, 1
  LOAD r13, r4
  ADDI r4, 1
  LOAD r14, r4

  ; gravity
  ADDI r13, 1
  LDI r15, 8
  CMP r13, r15
  BLT r0, up_grav_ok
  MOV r13, r15
up_grav_ok:

  ; input
  IKEY r7
  LDI r6, 65
  CMP r7, r6
  JZ r0, up_left
  LDI r6, 97
  CMP r7, r6
  JZ r0, up_left
  LDI r6, 68
  CMP r7, r6
  JZ r0, up_right
  LDI r6, 100
  CMP r7, r6
  JZ r0, up_right
  LDI r6, 87
  CMP r7, r6
  JZ r0, up_jump
  LDI r6, 119
  CMP r7, r6
  JZ r0, up_jump
  LDI r6, 32
  CMP r7, r6
  JZ r0, up_jump
  LDI r6, 82
  CMP r7, r6
  JZ r0, up_restart
  LDI r6, 114
  CMP r7, r6
  JZ r0, up_restart
  JMP up_after

up_left:
  LDI r12, 0
  SUBI r12, 3
  JMP up_after

up_right:
  LDI r12, 3
  JMP up_after

up_jump:
  LDI r6, 1
  CMP r14, r6
  JZ r0, up_do_jump
  JMP up_after
up_do_jump:
  LDI r13, 0
  SUBI r13, 7
  LDI r14, 0
  JMP up_after

up_restart:
  POP r31
  JMP restart

up_after:
  ; friction
  LDI r6, 0
  CMP r12, r6
  BLT r0, up_fric_neg
  JZ r0, up_fric_done
  SUBI r12, 1
  LDI r6, 0
  CMP r12, r6
  BGE r0, up_fric_done
  LDI r12, 0
  JMP up_fric_done
up_fric_neg:
  ADDI r12, 1
  LDI r6, 0
  CMP r12, r6
  BLT r0, up_fric_done
  LDI r12, 0
up_fric_done:

  ; move x
  ADD r10, r12
  LDI r6, 0
  CMP r10, r6
  BLT r0, up_cx0
  LDI r6, 500
  CMP r10, r6
  BLT r0, up_xok
  MOV r10, r6
  JMP up_xok
up_cx0:
  LDI r10, 0
up_xok:

  ; move y
  LDI r14, 0
  ADD r11, r13
  LDI r6, 240
  CMP r11, r6
  BLT r0, up_yok
  LDI r11, 240
  LDI r13, 0
  LDI r14, 1
  JMP up_vcoll
up_yok:
  LDI r6, 0
  CMP r11, r6
  BGE r0, up_vcoll
  LDI r11, 0
  LDI r13, 0
  JMP up_store

up_vcoll:
  ; check vertical collision at feet if falling
  LDI r6, 0
  CMP r13, r6
  BLT r0, up_vcheck_up
  ; falling: check feet (py+12)
  PUSH r31
  MOV r1, r11
  ADDI r1, 12
  MOV r11, r1
  CALL check_solid
  POP r31
  LDI r6, 1
  CMP r12, r6
  JZ r0, up_snap_down
  JMP up_echeck
up_snap_down:
  ; snap feet to tile top: player_y = (feet_y / 16) * 16 - 12
  LDI r6, 16
  MOV r1, r11
  LDI r15, 16
  DIV r1, r15
  MUL r1, r15
  SUBI r1, 12
  MOV r11, r1
  LDI r13, 0
  LDI r14, 1
  JMP up_echeck

up_vcheck_up:
  ; rising: check head
  PUSH r31
  CALL check_solid
  POP r31
  LDI r6, 1
  CMP r12, r6
  JZ r0, up_snap_up
  JMP up_echeck
up_snap_up:
  LDI r6, 16
  MOV r1, r11
  LDI r15, 16
  DIV r1, r15
  ADDI r1, 1
  MUL r1, r15
  MOV r11, r1
  LDI r13, 0

up_echeck:
  ; check enemy collision
  PUSH r31
  CALL check_enemy_hit
  POP r31

  ; check coin pickup
  PUSH r10
  PUSH r11
  PUSH r31
  CALL check_coin_pickup
  POP r31
  POP r11
  POP r10

up_store:
  LDI r4, 0x3000
  STORE r4, r10
  ADDI r4, 1
  STORE r4, r11
  ADDI r4, 1
  STORE r4, r12
  ADDI r4, 1
  STORE r4, r13
  ADDI r4, 1
  STORE r4, r14
  POP r31
  RET

; ═══════════════════════════════════════════════════════════════════
; CHECK ENEMY HIT
; ═══════════════════════════════════════════════════════════════════
check_enemy_hit:
  LDI r4, 0x3006
  LOAD r1, r4
  CMPI r1, 1
  JNZ r0, ceh_done
  LDI r4, 0x3000
  LOAD r10, r4
  ADDI r4, 1
  LOAD r11, r4
  ; enemy 0
  LDI r4, 0x3200
  LOAD r2, r4
  ADDI r4, 1
  LOAD r3, r4
  ADDI r4, 4
  LOAD r6, r4
  CMPI r6, 0
  JZ r0, ceh_e1
  MOV r7, r10
  SUB r7, r2
  MUL r7, r7
  MOV r8, r11
  SUB r8, r3
  MUL r8, r8
  ADD r7, r8
  LDI r6, 196
  CMP r7, r6
  BLT r0, ceh_die
ceh_e1:
  ; enemy 1
  LDI r4, 0x3220
  LOAD r2, r4
  ADDI r4, 1
  LOAD r3, r4
  ADDI r4, 4
  LOAD r6, r4
  CMPI r6, 0
  JZ r0, ceh_done
  MOV r7, r10
  SUB r7, r2
  MUL r7, r7
  MOV r8, r11
  SUB r8, r3
  MUL r8, r8
  ADD r7, r8
  LDI r6, 196
  CMP r7, r6
  BLT r0, ceh_die
  JMP ceh_done
ceh_die:
  LDI r4, 0x3006
  LDI r1, 2
  STORE r4, r1
  LDI r4, 0x3008
  LDI r1, 0
  STORE r4, r1
ceh_done:
  RET

; ═══════════════════════════════════════════════════════════════════
; CHECK COIN PICKUP
; ═══════════════════════════════════════════════════════════════════
check_coin_pickup:
  LDI r4, 0x3000
  LOAD r10, r4
  ADDI r4, 1
  LOAD r11, r4
  ADDI r10, 6
  ADDI r11, 6
  ; scan 3x3 tiles around player center
  LDI r14, 0
ccp_rloop:
  CMPI r14, 3
  BLT r0, ccp_rlp_ok
  JMP ccp_done
ccp_rlp_ok:
  LDI r13, 0
ccp_cloop:
  CMPI r13, 3
  BLT r0, ccp_clp_ok
  ADDI r14, 1
  JMP ccp_rloop
ccp_clp_ok:
  ; world pos of tile center
  MOV r1, r10
  SUBI r1, 6
  MOV r2, r13
  SUBI r2, 1
  LDI r6, 16
  MUL r2, r6
  ADDI r2, 8
  ADD r1, r2
  MOV r3, r11
  SUBI r3, 6
  MOV r4, r14
  SUBI r4, 1
  LDI r6, 16
  MUL r4, r6
  ADDI r4, 8
  ADD r3, r4
  PUSH r31
  MOV r10, r1
  MOV r11, r3
  CALL get_tile
  POP r31
  ; r12 = tile type
  LDI r6, 3
  CMP r12, r6
  JZ r0, ccp_found
  ADDI r13, 1
  JMP ccp_cloop

ccp_found:
  ; clear tile: compute index = (tile_row * 32 + tile_col)
  PUSH r31
  ; recompute tile coords from r1,r3
  MOV r10, r1
  MOV r11, r3
  CALL get_tile
  MOV r1, r10
  LDI r6, 4
  SHR r1, r6
  MOV r2, r11
  LDI r6, 4
  SHR r2, r6
  LDI r6, 32
  MUL r2, r6
  ADD r1, r2
  LDI r6, 0x2000
  ADD r6, r1
  LDI r1, 0
  STORE r6, r1
  POP r31
  ; add score
  LDI r4, 0x3005
  LOAD r1, r4
  ADDI r1, 100
  STORE r4, r1
  JMP ccp_done

ccp_done:
  RET

; ═══════════════════════════════════════════════════════════════════
; UPDATE ENEMIES -- patrol back and forth
; ═══════════════════════════════════════════════════════════════════
update_enemies:
  PUSH r31
  CALL update_enemy0
  POP r31
  ; enemy 1 inlined (same logic, different base)
  LDI r4, 0x3220
  LOAD r10, r4
  ADDI r4, 1
  LOAD r11, r4
  ADDI r4, 4
  LOAD r13, r4
  CMPI r13, 0
  JZ r0, ue1_done
  ADDI r4, 1
  LOAD r14, r4
  ADDI r4, 1
  LOAD r15, r4
  ADDI r4, 1
  LOAD r1, r4
  ADD r10, r14
  MOV r2, r1
  ADD r2, r15
  CMP r10, r2
  BLT r0, ue1_in
  MOV r10, r2
  SUBI r10, 1
  LDI r14, 0
  SUBI r14, 1
  JMP ue1_st
ue1_in:
  CMP r10, r1
  BGE r0, ue1_st
  MOV r10, r1
  LDI r14, 1
ue1_st:
  LDI r4, 0x3220
  STORE r4, r10
  ADDI r4, 1
  STORE r4, r11
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1
  ADDI r4, 3
  LDI r1, 1
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r14
ue1_done:
  RET

update_enemy0:
  LDI r4, 0x3200
  LOAD r10, r4
  ADDI r4, 1
  LOAD r11, r4
  ADDI r4, 4
  LOAD r13, r4
  CMPI r13, 0
  JZ r0, ue0_done
  ADDI r4, 1
  LOAD r14, r4
  ADDI r4, 1
  LOAD r15, r4
  ADDI r4, 1
  LOAD r1, r4
  ADD r10, r14
  MOV r2, r1
  ADD r2, r15
  CMP r10, r2
  BLT r0, ue0_in
  MOV r10, r2
  SUBI r10, 1
  LDI r14, 0
  SUBI r14, 1
  JMP ue0_st
ue0_in:
  CMP r10, r1
  BGE r0, ue0_st
  MOV r10, r1
  LDI r14, 1
ue0_st:
  LDI r4, 0x3200
  STORE r4, r10
  ADDI r4, 1
  STORE r4, r11
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1
  ADDI r4, 3
  LDI r1, 1
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r14
ue0_done:
  RET

; ═══════════════════════════════════════════════════════════════════
; UPDATE CAMERA -- smooth follow player
; ═══════════════════════════════════════════════════════════════════
update_camera:
  LDI r4, 0x3000
  LOAD r10, r4
  LDI r4, 0x3009
  LOAD r11, r4
  MOV r12, r10
  SUBI r12, 120
  CMP r12, r11
  BLT r0, uc_left
  JZ r0, uc_done
  ADDI r11, 2
  JMP uc_clamp
uc_left:
  SUBI r11, 2
uc_clamp:
  LDI r6, 0
  CMP r11, r6
  BGE r0, uc_ok
  LDI r11, 0
uc_ok:
  LDI r6, 272
  CMP r11, r6
  BLT r0, uc_st
  MOV r11, r6
uc_st:
  LDI r4, 0x3009
  STORE r4, r11
uc_done:
  RET

; ═══════════════════════════════════════════════════════════════════
; DRAW FRAME
; ═══════════════════════════════════════════════════════════════════
draw_frame:
  PUSH r31
  ; sky blue background
  LDI r1, 0x303060
  FILL r1
  ; load camera into r20
  LDI r4, 0x3009
  LOAD r20, r4
  ; draw tiles
  PUSH r31
  CALL draw_tiles
  POP r31
  ; draw enemies
  PUSH r31
  CALL draw_enemies
  POP r31
  ; draw player
  PUSH r31
  CALL draw_player
  POP r31
  ; draw HUD
  PUSH r31
  CALL draw_hud
  POP r31
  POP r31
  RET

; ═══════════════════════════════════════════════════════════════════
; DRAW TILES -- render visible tiles as colored rectangles
; All RECTF args are registers (loaded from immediates into r21-r25)
; ═══════════════════════════════════════════════════════════════════
draw_tiles:
  ; preload colors into registers
  LDI r21, 0x8B4513       ; ground brown
  LDI r22, 0x654321       ; ground dark
  LDI r23, 0x228B22       ; platform green
  LDI r24, 0x32CD32       ; platform light
  LDI r25, 0xFFD700       ; coin gold
  ; tile size = 16
  LDI r19, 16
  LDI r26, 16          ; height for RECTF
  ; screen col loop (0..16 for 17 visible cols)
  LDI r17, 0
dt_cols:
  CMPI r17, 17
  BLT r0, dt_col_ok
  JMP dt_done
dt_col_ok:
  ; screen_x = col * 16
  MOV r18, r17
  MUL r18, r19
  ; world tile col = col + camera/16
  MOV r1, r20
  LDI r6, 4
  SHR r1, r6
  ADD r1, r17
  LDI r6, 31
  CMP r1, r6
  BLT r0, dt_rows
  MOV r1, r6
dt_rows:
  MOV r16, r1             ; r16 = world tile col
  ; tile row loop (0..15)
  LDI r15, 0
dt_rloop:
  CMPI r15, 16
  BLT r0, dt_rlp_ok
  ADDI r17, 1
  JMP dt_cols
dt_rlp_ok:
  ; tile index = row*32 + col
  MOV r1, r15
  LDI r6, 32
  MUL r1, r6
  ADD r1, r16
  LDI r6, 0x2000
  ADD r6, r1
  LOAD r26, r6            ; r26 = tile type
  ; screen_y = row * 16
  MOV r27, r15
  MUL r27, r19
  CMPI r26, 0
  JZ r0, dt_next
  CMPI r26, 1
  JZ r0, dt_ground
  CMPI r26, 2
  JZ r0, dt_plat
  CMPI r26, 3
  JZ r0, dt_coin
  JMP dt_next
dt_ground:
  RECTF r18, r27, r19, r26, r21
  ADDI r27, 12
  RECTF r18, r27, r19, r26, r22
  JMP dt_next
dt_plat:
  RECTF r18, r27, r19, r26, r23
  RECTF r18, r27, r19, r26, r24
  JMP dt_next
dt_coin:
  ADDI r18, 4
  ADDI r27, 4
  RECTF r18, r27, r19, r26, r25
  JMP dt_next
dt_next:
  ADDI r15, 1
  JMP dt_rloop
dt_done:
  RET

; ═══════════════════════════════════════════════════════════════════
; DRAW ENEMIES -- red squares with white eyes
; ═══════════════════════════════════════════════════════════════════
draw_enemies:
  LDI r21, 0xFF0000       ; red body
  LDI r22, 0xFFFFFF       ; white eyes
  LDI r19, 12             ; size
  LDI r25, 12
  ; enemy 0
  LDI r4, 0x3204
  LOAD r6, r4
  CMPI r6, 0
  JZ r0, de_e1
  LDI r4, 0x3200
  LOAD r10, r4
  ADDI r4, 1
  LOAD r11, r4
  SUB r10, r20
  LDI r6, 20
  CMP r10, r6
  BLT r0, de_e1
  LDI r6, 260
  CMP r10, r6
  BGE r0, de_e1
  RECTF r10, r11, r19, r25, r21
  ADDI r10, 3
  ADDI r11, 3
  RECTF r10, r11, r19, r25, r22
  ADDI r10, 4
  RECTF r10, r11, r19, r25, r22
de_e1:
  ; enemy 1
  LDI r4, 0x3224
  LOAD r6, r4
  CMPI r6, 0
  JZ r0, de_done
  LDI r4, 0x3220
  LOAD r10, r4
  ADDI r4, 1
  LOAD r11, r4
  SUB r10, r20
  LDI r6, 20
  CMP r10, r6
  BLT r0, de_done
  LDI r6, 260
  CMP r10, r6
  BGE r0, de_done
  RECTF r10, r11, r19, r25, r21
  ADDI r10, 3
  ADDI r11, 3
  RECTF r10, r11, r19, r25, r22
  ADDI r10, 4
  RECTF r10, r11, r19, r25, r22
de_done:
  RET

; ═══════════════════════════════════════════════════════════════════
; DRAW PLAYER -- blue square
; ═══════════════════════════════════════════════════════════════════
draw_player:
  LDI r4, 0x3006
  LOAD r6, r4
  CMPI r6, 2
  JZ r0, dp_dead
  LDI r4, 0x3000
  LOAD r10, r4
  ADDI r4, 1
  LOAD r11, r4
  SUB r10, r20
  LDI r21, 0x4444FF
  LDI r22, 0x6666FF
  LDI r19, 12
  LDI r25, 12
  RECTF r10, r11, r19, r25, r21
  ADDI r10, 2
  ADDI r11, 1
  RECTF r10, r11, r19, r25, r22
  RET
dp_dead:
  ; flash red every 4 frames
  LDI r4, 0x3008
  LOAD r6, r4
  LDI r7, 3
  AND r6, r7
  JZ r6, dp_invis
  LDI r4, 0x3000
  LOAD r10, r4
  ADDI r4, 1
  LOAD r11, r4
  SUB r10, r20
  LDI r21, 0xFF4444
  LDI r19, 12
  LDI r25, 12
  RECTF r10, r11, r19, r25, r21
dp_invis:
  RET

; ═══════════════════════════════════════════════════════════════════
; DRAW HUD -- score display at top
; ═══════════════════════════════════════════════════════════════════
draw_hud:
  ; build "SCORE: NNN" at 0x5000
  LDI r4, 0x5000
  LDI r1, 83
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 67
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 79
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 82
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 69
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 58
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 32
  STORE r4, r1
  ; score digits
  LDI r5, 0x3005
  LOAD r7, r5
  LDI r6, 100
  MOV r8, r7
  DIV r8, r6
  ADDI r8, 48
  STORE r4, r8
  ADDI r4, 1
  MOD r7, r6
  LDI r6, 10
  MOV r8, r7
  DIV r8, r6
  ADDI r8, 48
  STORE r4, r8
  ADDI r4, 1
  MOD r7, r6
  ADDI r7, 48
  STORE r4, r7
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1
  ; render
  LDI r10, 0x5000
  LDI r11, 4
  LDI r12, 4
  TEXT r11, r12, r10
  RET

; ═══════════════════════════════════════════════════════════════════
; DRAW TITLE SCREEN
; ═══════════════════════════════════════════════════════════════════
draw_title:
  LDI r1, 0x101030
  FILL r1
  ; "PLATFORMER" at 0x5000
  LDI r4, 0x5000
  LDI r1, 80
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 76
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 65
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 84
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 70
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 79
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 82
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 77
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 69
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 82
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1
  LDI r10, 0x5000
  LDI r11, 70
  LDI r12, 80
  TEXT r11, r12, r10
  ; "W = START" at 0x5020
  LDI r4, 0x5020
  LDI r1, 87
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 32
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 61
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 32
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 83
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 84
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 65
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 82
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 84
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1
  LDI r10, 0x5020
  LDI r11, 68
  LDI r12, 130
  TEXT r11, r12, r10
  RET

; ═══════════════════════════════════════════════════════════════════
; DRAW GAME OVER
; ═══════════════════════════════════════════════════════════════════
draw_game_over:
  LDI r1, 0x300000
  FILL r1
  LDI r4, 0x5000
  LDI r1, 71
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 65
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 77
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 69
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 32
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 79
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 86
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 69
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 82
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1
  LDI r10, 0x5000
  LDI r11, 68
  LDI r12, 100
  TEXT r11, r12, r10
  LDI r4, 0x5020
  LDI r1, 80
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 82
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 69
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 83
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 83
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 32
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 82
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1
  LDI r10, 0x5020
  LDI r11, 72
  LDI r12, 140
  TEXT r11, r12, r10
  RET

; ═══════════════════════════════════════════════════════════════════
; MAIN LOOP -- game state machine
; ═══════════════════════════════════════════════════════════════════
main_loop:
  LDI r4, 0x3006
  LOAD r1, r4
  CMPI r1, 0
  JZ r0, state_title
  CMPI r1, 1
  JZ r0, state_play
  CMPI r1, 2
  JZ r0, state_dead
  JMP main_loop

state_title:
  CALL draw_title
  FRAME
  IKEY r7
  JZ r7, main_loop
  LDI r4, 0x3006
  LDI r1, 1
  STORE r4, r1
  JMP main_loop

state_play:
  ; throttle to ~30fps
  LDI r4, 0xFFE
  LOAD r8, r4
  LDI r9, 1
  AND r8, r9
  JNZ r8, sp_draw
  CALL update_player
  CALL update_enemies
  CALL update_camera
sp_draw:
  CALL draw_frame
  FRAME
  JMP main_loop

state_dead:
  LDI r4, 0x3008
  LOAD r1, r4
  ADDI r1, 1
  STORE r4, r1
  LDI r6, 90
  CMP r1, r6
  BLT r0, sd_wait
  CALL draw_game_over
  FRAME
  IKEY r7
  LDI r6, 82
  CMP r7, r6
  JZ r0, restart
  LDI r6, 114
  CMP r7, r6
  JZ r0, restart
  JMP main_loop
sd_wait:
  CALL draw_frame
  FRAME
  JMP main_loop
