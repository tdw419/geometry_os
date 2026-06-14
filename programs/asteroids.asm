; asteroids.asm -- Classic Asteroids arcade game for Geometry OS
; Controls: A/D=rotate, W=thrust, Space=shoot, R=restart
;
; Memory layout:
;   0x2000-0x200C  Ship (13 words): x y angle vx vy lives score wave dead cd invuln bul_idx ast_cnt
;   0x3000-0x30FF  Sine table (256 words, triangle -126..+126)
;   0x4000-0x4027  Asteroids (8 * 5 words): x y vx vy size (255=empty)
;   0x4200-0x420F  Bullets (4 * 4 words): x y vx vy (active if x<256)
;   0x5000-0x50FF  Text buffer

; ── ENTRY ────────────────────────────────────────────────
restart:
  LDI r30, 0xFE00
  PUSH r31
  CALL build_sine
  POP r31
  PUSH r31
  CALL init_game
  POP r31
  JMP game_loop

; ── SINE TABLE (triangle wave -126..+126) ──────────────
build_sine:
  LDI r20, 0x3000
  LDI r10, 0
sin_lp:
  CMPI r10, 64
  BLT r0, sq01
  CMPI r10, 192
  BLT r0, sq23
  ; sq45: 192..255 ramp from -126 toward 0
  LDI r19, 256
  SUB r19, r10
  SHLI r19, 1
  NEG r19
  JMP sin_st
sq23:
  ; 64..191 ramp from 126 down to -126
  LDI r19, 128
  SUB r19, r10
  SHLI r19, 1
  JMP sin_st
sq01:
  ; 0..63 ramp from 0 to 126
  MOV r19, r10
  SHLI r19, 1
sin_st:
  MOV r21, r20
  ADD r21, r10
  STORE r21, r19
  ADDI r10, 1
  CMPI r10, 256
  BLT r0, sin_lp
  RET

; ── INIT GAME ───────────────────────────────────────────
; Ship fields: 0x2000=x 0x2001=y 0x2002=ang 0x2003=vx 0x2004=vy
;              0x2005=lives 0x2006=score 0x2007=wave 0x2008=dead
;              0x2009=cooldown 0x200A=invuln 0x200B=bul_idx 0x200C=ast_cnt
init_game:
  LDI r4, 0x2000
  LDI r1, 128
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
  LDI r1, 3
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 1
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
  STORE r4, r1
  ; Clear bullets (16 words at 0x4200)
  LDI r20, 0x4200
  LDI r21, 16
  LDI r1, 0
clr_bul:
  STORE r20, r1
  ADDI r20, 1
  SUBI r21, 1
  JNZ r21, clr_bul
  ; Clear asteroids (40 words at 0x4000)
  LDI r20, 0x4000
  LDI r21, 40
  LDI r1, 0
clr_ast:
  STORE r20, r1
  ADDI r20, 1
  SUBI r21, 1
  JNZ r21, clr_ast
  ; Mark all asteroid slots as empty (size=255)
  LDI r20, 0x4000
  LDI r21, 8
  LDI r1, 255
mk_empty:
  MOV r22, r20
  ADDI r22, 4
  STORE r22, r1
  ADDI r20, 5
  SUBI r21, 1
  JNZ r21, mk_empty
  ; Spawn first wave
  PUSH r31
  CALL spawn_wave
  POP r31
  RET

; ── SPAWN WAVE ──────────────────────────────────────────
spawn_wave:
  ; wave = min(current_wave + 1, 8) asteroids
  LDI r4, 0x2007
  LOAD r1, r4
  ADDI r1, 1
  LDI r5, 8
  CMP r1, r5
  BLT r0, sw_ok
  LDI r1, 8
sw_ok:
  MOV r21, r1
  LDI r4, 0x200C
  STORE r4, r1
sw_lp:
  JZ r21, sw_done
  ; Find empty asteroid slot
  LDI r22, 0
sw_find:
  CMPI r22, 40
  BLT r0, sw_chk
  JMP sw_done
sw_chk:
  LDI r23, 0x4000
  ADD r23, r22
  ADDI r23, 4
  LOAD r24, r23
  CMPI r24, 255
  JZ r0, sw_found
  ADDI r22, 5
  JMP sw_find
sw_found:
  ; Spawn asteroid at slot r22
  LDI r23, 0x4000
  ADD r23, r22
  ; Random position on edges
  RAND r1
  ANDI r1, 0xFF
  CMPI r1, 32
  BLT r0, sx_ok
  CMPI r1, 224
  BLT r0, sx_ok2
  LDI r1, 32
  JMP sx_done
sx_ok2:
  LDI r1, 224
  JMP sx_done
sx_ok:
  RAND r2
  ANDI r2, 0xFF
  CMPI r2, 32
  BLT r0, sy_ok
  CMPI r2, 224
  BLT r0, sy_ok2
  LDI r2, 32
  JMP sy_done
sy_ok2:
  LDI r2, 224
  JMP sy_done
sy_ok:
sy_done:
sx_done:
  ; Random velocity (-2 to +1)
  RAND r3
  ANDI r3, 3
  LDI r5, 1
  SUB r3, r5
  RAND r6
  ANDI r6, 3
  SUB r6, r5
  ; Store asteroid
  STORE r23, r1
  LDI r23, 0x4000
  ADD r23, r22
  ADDI r23, 1
  STORE r23, r2
  ADDI r23, 1
  STORE r23, r3
  ADDI r23, 1
  STORE r23, r6
  ADDI r23, 1
  LDI r1, 0
  STORE r23, r1
  ; Increment ast_count
  LDI r4, 0x200C
  LOAD r1, r4
  ADDI r1, 1
  STORE r4, r1
  SUBI r21, 1
  JMP sw_lp
sw_done:
  RET

; ── MAIN GAME LOOP ─────────────────────────────────────
game_loop:
  LDI r4, 0x2008
  LOAD r1, r4
  JNZ r1, game_over
  ; Read input
  IKEY r7
  CMPI r7, 65
  JZ r0, rot_l
  CMPI r7, 97
  JZ r0, rot_l
  CMPI r7, 68
  JZ r0, rot_r
  CMPI r7, 100
  JZ r0, rot_r
  CMPI r7, 87
  JZ r0, do_thrust
  CMPI r7, 119
  JZ r0, do_thrust
  CMPI r7, 32
  JZ r0, do_shoot
  JMP no_input
rot_l:
  LDI r4, 0x2002
  LOAD r1, r4
  ADDI r1, 240
  ANDI r1, 0xFF
  STORE r4, r1
  JMP no_input
rot_r:
  LDI r4, 0x2002
  LOAD r1, r4
  ADDI r1, 16
  ANDI r1, 0xFF
  STORE r4, r1
  JMP no_input
do_thrust:
  ; Add velocity in ship's facing direction
  LDI r4, 0x2002
  LOAD r16, r4
  ; cos = sine(angle + 64)
  MOV r17, r16
  ADDI r17, 64
  ANDI r17, 0xFF
  LDI r18, 0x3000
  ADD r18, r17
  LOAD r18, r18
  ; sin = sine(angle)
  LDI r17, 0x3000
  ADD r17, r16
  LOAD r17, r17
  ; Scale by 1/8 (shift right 3)
  SAR r18, r1
  LDI r1, 3
  SAR r18, r1
  SAR r17, r1
  ; Add to velocity
  LDI r4, 0x2003
  LOAD r1, r4
  ADD r1, r18
  STORE r4, r1
  LDI r4, 0x2004
  LOAD r1, r4
  ADD r1, r17
  STORE r4, r1
  JMP no_input
do_shoot:
  ; Check cooldown
  LDI r4, 0x2009
  LOAD r1, r4
  JNZ r1, no_input
  LDI r1, 15
  STORE r4, r1
  ; Get bullet slot index
  LDI r4, 0x200B
  LOAD r22, r4
  SHLI r22, 2
  LDI r23, 0x4200
  ADD r23, r22
  ; Get ship angle
  LDI r4, 0x2002
  LOAD r16, r4
  ; cos = sine(angle + 64), sin = sine(angle)
  MOV r17, r16
  ADDI r17, 64
  ANDI r17, 0xFF
  LDI r18, 0x3000
  ADD r18, r17
  LOAD r18, r18
  LDI r17, 0x3000
  ADD r17, r16
  LOAD r17, r17
  ; Bullet velocity = direction * 3/4
  SHLI r18, 1
  ADD r18, r18
  LDI r1, 4
  SAR r18, r1
  SHLI r17, 1
  ADD r17, r17
  SAR r17, r1
  ; Bullet start position = ship pos + direction * 12
  LDI r4, 0x2000
  LOAD r27, r4
  SHLI r18, 1
  ADD r18, r18
  LDI r1, 5
  SAR r18, r1
  ADD r27, r18
  LDI r4, 0x2001
  LOAD r28, r4
  SHLI r17, 1
  ADD r17, r17
  SAR r17, r1
  ADD r28, r17
  ; Store bullet: x, y, vx, vy
  STORE r23, r27
  ADDI r23, 1
  STORE r23, r28
  ADDI r23, 1
  STORE r23, r18
  ADDI r23, 1
  STORE r23, r17
  ; Advance bullet index
  LDI r4, 0x200B
  LOAD r1, r4
  ADDI r1, 1
  ANDI r1, 3
  STORE r4, r1
no_input:
  ; Decrement cooldown
  LDI r4, 0x2009
  LOAD r1, r4
  JZ r1, cd_ok
  SUBI r1, 1
  STORE r4, r1
cd_ok:
  ; Decrement invulnerability
  LDI r4, 0x200A
  LOAD r1, r4
  JZ r1, inv_ok
  SUBI r1, 1
  STORE r4, r1
inv_ok:
  ; Update ship position
  LDI r4, 0x2000
  LOAD r1, r4
  LDI r5, 0x2003
  LOAD r2, r5
  ADD r1, r2
  STORE r4, r1
  LDI r4, 0x2001
  LOAD r1, r4
  LDI r5, 0x2004
  LOAD r2, r5
  ADD r1, r2
  STORE r4, r1
  ; Wrap ship
  CALL wrap_xy_ship
  ; Update bullets
  CALL update_bullets
  ; Update asteroids
  CALL update_asteroids
  ; Check collisions
  CALL check_collisions
  ; Check if all asteroids destroyed -> next wave
  LDI r4, 0x200C
  LOAD r1, r4
  JNZ r1, draw_start
  LDI r4, 0x2007
  LOAD r1, r4
  ADDI r1, 1
  STORE r4, r1
  PUSH r31
  CALL spawn_wave
  POP r31
draw_start:
  ; Clear screen
  LDI r9, 0
  FILL r9
  ; Draw everything
  CALL draw_asteroids
  CALL draw_bullets
  CALL draw_ship
  CALL draw_hud
  FRAME
  JMP game_loop

; ── WRAP SHIP POSITION ─────────────────────────────────
wrap_xy_ship:
  LDI r4, 0x2000
  LOAD r1, r4
  CMPI r1, 256
  BLT r0, ws_y
  SUBI r1, 256
  STORE r4, r1
ws_y:
  LDI r4, 0x2001
  LOAD r1, r4
  CMPI r1, 256
  BLT r0, ws_done
  SUBI r1, 256
  STORE r4, r1
ws_done:
  RET

; ── UPDATE BULLETS ──────────────────────────────────────
update_bullets:
  LDI r20, 0x4200
  LDI r21, 4
ub_lp:
  JZ r21, ub_done
  ; Load bullet: x(r1), y(r2), vx(r3), vy(r4)
  LOAD r1, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r2, r22
  ADDI r22, 1
  LOAD r3, r22
  ADDI r22, 1
  LOAD r4, r22
  ; Check if off screen (x>=256 or y>=256)
  CMPI r1, 256
  BLT r0, ub_ychk
  ; Off screen - mark inactive (set x=0xFFFF)
  LDI r5, 0xFFFF
  STORE r20, r5
  JMP ub_next
ub_ychk:
  CMPI r2, 256
  BLT r0, ub_move
  LDI r5, 0xFFFF
  STORE r20, r5
  JMP ub_next
ub_move:
  ; Update position
  ADD r1, r3
  STORE r20, r1
  MOV r22, r20
  ADDI r22, 1
  ADD r2, r4
  STORE r22, r2
ub_next:
  ADDI r20, 4
  SUBI r21, 1
  JMP ub_lp
ub_done:
  RET

; ── UPDATE ASTEROIDS ────────────────────────────────────
update_asteroids:
  LDI r20, 0x4000
  LDI r21, 8
ua_lp:
  JZ r21, ua_done
  ; Check if slot is active (size != 255)
  MOV r22, r20
  ADDI r22, 4
  LOAD r23, r22
  CMPI r23, 255
  JZ r0, ua_next
  ; Load x(r1), y(r2), vx(r3), vy(r4)
  LOAD r1, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r2, r22
  ADDI r22, 1
  LOAD r3, r22
  ADDI r22, 1
  LOAD r4, r22
  ; Move
  ADD r1, r3
  STORE r20, r1
  MOV r22, r20
  ADDI r22, 1
  ADD r2, r4
  STORE r22, r2
ua_next:
  ADDI r20, 5
  SUBI r21, 1
  JMP ua_lp
ua_done:
  ; Wrap asteroids
  LDI r20, 0x4000
  LDI r21, 8
wa_lp:
  JZ r21, wa_done
  MOV r22, r20
  ADDI r22, 4
  LOAD r23, r22
  CMPI r23, 255
  JZ r0, wa_next
  LOAD r1, r20
  CMPI r1, 256
  BLT r0, wa_ay
  SUBI r1, 256
  STORE r20, r1
wa_ay:
  MOV r22, r20
  ADDI r22, 1
  LOAD r1, r22
  CMPI r1, 256
  BLT r0, wa_nx
  SUBI r1, 256
  STORE r22, r1
wa_nx:
wa_next:
  ADDI r20, 5
  SUBI r21, 1
  JMP wa_lp
wa_done:
  RET

; ── CHECK COLLISIONS ────────────────────────────────────
check_collisions:
  ; Bullet-asteroid collisions
  LDI r20, 0x4200
  LDI r21, 4
cb_blp:
  JZ r21, cb_ship
  ; Load bullet x, y
  LOAD r10, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r11, r22
  ; Check if bullet is active (x < 256)
  CMPI r10, 256
  BLT r0, cb_astlp
  JMP cb_bnext
cb_astlp:
  LDI r23, 0x4000
  LDI r24, 8
cb_alp:
  JZ r24, cb_bnext
  ; Check if asteroid slot active
  MOV r25, r23
  ADDI r25, 4
  LOAD r26, r25
  CMPI r26, 255
  JZ r0, cb_anext
  ; Load asteroid x, y, size
  LOAD r1, r23
  MOV r25, r23
  ADDI r25, 1
  LOAD r2, r25
  ; Distance squared
  MOV r7, r10
  SUB r7, r1
  MUL r7, r7
  MOV r8, r11
  SUB r8, r2
  MUL r8, r8
  ADD r7, r8
  ; Collision radius depends on size
  CMPI r26, 2
  JZ r0, cb_sz0
  CMPI r26, 1
  JZ r0, cb_sz1
  LDI r5, 900
  CMP r7, r5
  BLT r0, cb_hit
  JMP cb_anext
cb_sz0:
  LDI r5, 625
  CMP r7, r5
  BLT r0, cb_hit
  JMP cb_anext
cb_sz1:
  LDI r5, 400
  CMP r7, r5
  BLT r0, cb_hit
  JMP cb_anext
cb_hit:
  ; Destroy asteroid (set size=255)
  MOV r25, r23
  ADDI r25, 4
  LDI r5, 255
  STORE r25, r5
  ; Deactivate bullet (set x=0xFFFF)
  LDI r5, 0xFFFF
  STORE r20, r5
  ; Add score
  CMPI r26, 2
  JZ r0, cb_sc0
  CMPI r26, 1
  JZ r0, cb_sc1
  LDI r5, 100
  JMP cb_addsc
cb_sc0:
  LDI r5, 25
  JMP cb_addsc
cb_sc1:
  LDI r5, 50
cb_addsc:
  LDI r4, 0x2006
  LOAD r1, r4
  ADD r1, r5
  STORE r4, r1
  ; Decrement ast_count
  LDI r4, 0x200C
  LOAD r1, r4
  SUBI r1, 1
  STORE r4, r1
  ; Split if not small (size != 2)
  CMPI r26, 2
  JZ r0, cb_nosplit
  ; Determine child size
  CMPI r26, 0
  JZ r0, cb_sp_lg
  LDI r1, 2
  JMP cb_do_sp
cb_sp_lg:
  LDI r1, 1
cb_do_sp:
  PUSH r31
  CALL spawn_children
  POP r31
cb_nosplit:
  ; Sound effect
  LDI r14, 440
  LDI r15, 80
  BEEP r14, r15
  JMP cb_alp
cb_anext:
  ADDI r23, 5
  SUBI r24, 1
  JMP cb_alp
cb_bnext:
  ADDI r20, 4
  SUBI r21, 1
  JMP cb_blp

  ; Ship-asteroid collisions
cb_ship:
  ; Check invulnerability
  LDI r4, 0x200A
  LOAD r1, r4
  JNZ r1, cb_done
  ; Load ship x, y
  LDI r4, 0x2000
  LOAD r10, r4
  LDI r4, 0x2001
  LOAD r11, r4
  LDI r23, 0x4000
  LDI r24, 8
cs_lp:
  JZ r24, cb_done
  MOV r25, r23
  ADDI r25, 4
  LOAD r26, r25
  CMPI r26, 255
  JZ r0, cs_next
  LOAD r1, r23
  MOV r25, r23
  ADDI r25, 1
  LOAD r2, r25
  MOV r7, r10
  SUB r7, r1
  MUL r7, r7
  MOV r8, r11
  SUB r8, r2
  MUL r8, r8
  ADD r7, r8
  LDI r5, 484
  CMP r7, r5
  BLT r0, cs_die
  JMP cs_next
cs_die:
  ; Lose a life
  LDI r4, 0x2005
  LOAD r1, r4
  SUBI r1, 1
  STORE r4, r1
  ; Sound
  LDI r14, 220
  LDI r15, 200
  BEEP r14, r15
  ; Check game over
  JNZ r1, cs_over
  ; Respawn at center
  LDI r4, 0x2000
  LDI r1, 128
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
  ; Invulnerability
  LDI r4, 0x200A
  LDI r1, 120
  STORE r4, r1
  JMP cb_done
cs_over:
  LDI r4, 0x2008
  LDI r1, 1
  STORE r4, r1
  JMP cb_done
cs_next:
  ADDI r23, 5
  SUBI r24, 1
  JMP cs_lp
cb_done:
  RET

; ── SPAWN CHILDREN (after asteroid destruction) ──────────
; r1 = asteroid x (from LOAD r1, r23), r2 = asteroid y
; Actually we need to reload - the registers may be clobbered
; Stack: child_size in r1
spawn_children:
  ; Reload parent position from the asteroid slot we just hit
  ; r23 still points to the asteroid base
  LOAD r5, r23
  MOV r22, r23
  ADDI r22, 1
  LOAD r6, r22
  ; Random velocities for child 1
  RAND r2
  ANDI r2, 3
  LDI r3, 1
  SUB r2, r3
  RAND r7
  ANDI r7, 3
  SUB r7, r3
  ; Find empty slot for child 1
  LDI r20, 0x4000
  LDI r21, 8
sp_f1:
  JZ r21, sp_done
  MOV r22, r20
  ADDI r22, 4
  LOAD r23, r22
  CMPI r23, 255
  JZ r0, sp_s1
  ADDI r20, 5
  SUBI r21, 1
  JMP sp_f1
sp_s1:
  STORE r20, r5
  ADDI r20, 1
  STORE r20, r6
  ADDI r20, 1
  STORE r20, r2
  ADDI r20, 1
  STORE r20, r7
  ADDI r20, 1
  STORE r20, r1
  LDI r4, 0x200C
  LOAD r8, r4
  ADDI r8, 1
  STORE r4, r8
  ; Child 2: opposite velocities
  NEG r2
  NEG r7
  LDI r20, 0x4000
  LDI r21, 8
sp_f2:
  JZ r21, sp_done
  MOV r22, r20
  ADDI r22, 4
  LOAD r23, r22
  CMPI r23, 255
  JZ r0, sp_s2
  ADDI r20, 5
  SUBI r21, 1
  JMP sp_f2
sp_s2:
  STORE r20, r5
  ADDI r20, 1
  STORE r20, r6
  ADDI r20, 1
  STORE r20, r2
  ADDI r20, 1
  STORE r20, r7
  ADDI r20, 1
  STORE r20, r1
  LDI r4, 0x200C
  LOAD r8, r4
  ADDI r8, 1
  STORE r4, r8
sp_done:
  RET

; ── DRAW SHIP ───────────────────────────────────────────
draw_ship:
  ; Check invulnerability blink
  LDI r4, 0x200A
  LOAD r1, r4
  JZ r1, ds_draw
  ANDI r1, 8
  JNZ r1, ds_skip
ds_draw:
  ; Load angle
  LDI r4, 0x2002
  LOAD r16, r4
  ; cos = sine(angle + 64)
  MOV r17, r16
  ADDI r17, 64
  ANDI r17, 0xFF
  LDI r18, 0x3000
  ADD r18, r17
  LOAD r18, r18
  ; sin = sine(angle)
  LDI r17, 0x3000
  ADD r17, r16
  LOAD r17, r17
  ; Load ship position
  LDI r4, 0x2000
  LOAD r14, r4
  LDI r4, 0x2001
  LOAD r15, r4
  ; Nose: pos + dir * 15
  LDI r19, 15
  MOV r21, r19
  MUL r21, r18
  LDI r22, 7
  SAR r21, r22
  ADD r21, r14
  MOV r23, r19
  MUL r23, r17
  SAR r23, r22
  ADD r23, r15
  ; Left wing: pos + rotate(dir, -100deg) * 10
  ; angle - 100 = angle + 156 (mod 256)
  MOV r24, r16
  ADDI r24, 156
  ANDI r24, 0xFF
  LDI r25, 0x3000
  ADD r25, r24
  LOAD r25, r25
  ; cos for left wing
  MOV r26, r24
  ADDI r26, 64
  ANDI r26, 0xFF
  LDI r27, 0x3000
  ADD r27, r26
  LOAD r27, r27
  ; sin for left wing
  LDI r19, 10
  MOV r28, r19
  MUL r28, r27
  SAR r28, r22
  ADD r28, r14
  MOV r29, r19
  MUL r29, r25
  SAR r29, r22
  ADD r29, r15
  ; Right wing: pos + rotate(dir, +100deg) * 10
  ; angle + 100
  MOV r24, r16
  ADDI r24, 100
  ANDI r24, 0xFF
  LDI r25, 0x3000
  ADD r25, r24
  LOAD r25, r25
  MOV r26, r24
  ADDI r26, 64
  ANDI r26, 0xFF
  LDI r27, 0x3000
  ADD r27, r26
  LOAD r27, r27
  LDI r19, 10
  MOV r1, r19
  MUL r1, r27
  SAR r1, r22
  ADD r1, r14
  MOV r2, r19
  MUL r2, r25
  SAR r2, r22
  ADD r2, r15
  ; Draw triangle
  LDI r3, 0x00FF00
  LINE r21, r23, r28, r29, r3
  LINE r28, r29, r1, r2, r3
  LINE r1, r2, r21, r23, r3
ds_skip:
  RET

; ── DRAW ASTEROIDS ─────────────────────────────────────
draw_asteroids:
  LDI r20, 0x4000
  LDI r21, 8
da_lp:
  JZ r21, da_done
  ; Check if active
  MOV r22, r20
  ADDI r22, 4
  LOAD r23, r22
  CMPI r23, 255
  JZ r0, da_next
  ; Load x, y, size
  LOAD r1, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r2, r22
  ADDI r22, 4
  LOAD r23, r22
  ; Draw circle based on size
  CMPI r23, 0
  JZ r0, da_large
  CMPI r23, 1
  JZ r0, da_med
  ; small
  LDI r4, 5
  LDI r5, 0x888888
  CIRCLE r1, r2, r4, r5
  JMP da_next
da_large:
  LDI r4, 18
  LDI r5, 0xAAAAAA
  CIRCLE r1, r2, r4, r5
  JMP da_next
da_med:
  LDI r4, 10
  LDI r5, 0xCCCCCC
  CIRCLE r1, r2, r4, r5
da_next:
  ADDI r20, 5
  SUBI r21, 1
  JMP da_lp
da_done:
  RET

; ── DRAW BULLETS ────────────────────────────────────────
draw_bullets:
  LDI r20, 0x4200
  LDI r21, 4
db_lp:
  JZ r21, db_done
  ; Load bullet x, y
  LOAD r1, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r2, r22
  ; Only draw if on screen
  CMPI r1, 256
  BLT r0, db_ychk
  JMP db_next
db_ychk:
  CMPI r2, 256
  BLT r0, db_draw
  JMP db_next
db_draw:
  LDI r3, 0xFFFFFF
  PSET r1, r2, r3
db_next:
  ADDI r20, 4
  SUBI r21, 1
  JMP db_lp
db_done:
  RET

; ── DRAW HUD ────────────────────────────────────────────
draw_hud:
  ; Score text
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
  ADDI r4, 1
  ; Score number (6 digits)
  LDI r5, 0x2006
  LOAD r9, r5
  LDI r6, 100000
  DIV r1, r6
  ADDI r1, 48
  STORE r4, r1
  MOD r9, r6
  ADDI r4, 1
  LDI r6, 10000
  DIV r1, r6
  ADDI r1, 48
  STORE r4, r1
  MOD r9, r6
  ADDI r4, 1
  LDI r6, 1000
  DIV r1, r6
  ADDI r1, 48
  STORE r4, r1
  MOD r9, r6
  ADDI r4, 1
  LDI r6, 100
  DIV r1, r6
  ADDI r1, 48
  STORE r4, r1
  MOD r9, r6
  ADDI r4, 1
  LDI r6, 10
  DIV r1, r6
  ADDI r1, 48
  STORE r4, r1
  MOD r9, r6
  ADDI r9, 48
  ADDI r4, 1
  STORE r4, r9
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1
  ; Render "SCORE: NNNNNN"
  LDI r10, 2
  LDI r11, 2
  LDI r12, 0x5000
  TEXT r10, r11, r12
  ; Lives text
  LDI r4, 0x5010
  LDI r1, 76
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 73
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 86
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 69
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 83
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 58
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 32
  STORE r4, r1
  ADDI r4, 1
  LDI r5, 0x2005
  LOAD r1, r5
  ADDI r1, 48
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1
  LDI r10, 200
  LDI r11, 2
  LDI r12, 0x5010
  TEXT r10, r11, r12
  ; Wave text
  LDI r4, 0x5020
  LDI r1, 87
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 65
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 86
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
  ADDI r4, 1
  LDI r5, 0x2007
  LOAD r1, r5
  ADDI r1, 48
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1
  LDI r10, 2
  LDI r11, 14
  LDI r12, 0x5020
  TEXT r10, r11, r12
  RET

; ── GAME OVER ───────────────────────────────────────────
game_over:
  LDI r9, 0
  FILL r9
  ; "GAME OVER" text
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
  LDI r10, 68
  LDI r11, 110
  LDI r12, 0x5000
  TEXT r10, r11, r12
  FRAME
  IKEY r7
  CMPI r7, 82
  JZ r0, restart
  CMPI r7, 114
  JZ r0, restart
  JMP game_over
