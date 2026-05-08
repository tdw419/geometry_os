; DESCRIPTION: Display a object using color colored at the screen.

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
  LDI r14, 0
sin_lp:
  CMPI r14, 64
  BLT r12, sq01
  CMPI r14, 192
  BLT r12, sq23
  ; sq45: 192..255 ramp from -126 toward 0
  LDI r19, 256
  SUB r19, r14
  SHLI r19, 1
  NEG r19
  JMP sin_st
sq23:
  ; 64..191 ramp from 126 down to -126
  LDI r19, 128
  SUB r19, r14
  SHLI r19, 1
  JMP sin_st
sq01:
  ; 0..63 ramp from 0 to 126
  MOV r19, r14
  SHLI r19, 1
sin_st:
  MOV r21, r20
  ADD r21, r14
  STORE r21, r19
  ADDI r14, 1
  CMPI r14, 256
  BLT r12, sin_lp
  RET

; ── INIT GAME ───────────────────────────────────────────
; Ship fields: 0x2000=x 0x2001=y 0x2002=ang 0x2003=vx 0x2004=vy
;              0x2005=lives 0x2006=score 0x2007=wave 0x2008=dead
;              0x2009=cooldown 0x200A=invuln 0x200B=bul_idx 0x200C=ast_cnt
init_game:
  LDI r13, 0x2000
  LDI r4, 128
  STORE r13, r4
  ADDI r13, 1
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 0
  STORE r13, r4
  ADDI r13, 1
  STORE r13, r4
  ADDI r13, 1
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 3
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 0
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 1
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 0
  STORE r13, r4
  ADDI r13, 1
  STORE r13, r4
  ADDI r13, 1
  STORE r13, r4
  ADDI r13, 1
  STORE r13, r4
  ADDI r13, 1
  STORE r13, r4
  ; Clear bullets (16 words at 0x4200)
  LDI r20, 0x4200
  LDI r21, 16
  LDI r4, 0
clr_bul:
  STORE r20, r4
  ADDI r20, 1
  SUBI r21, 1
  JNZ r21, clr_bul
  ; Clear asteroids (40 words at 0x4000)
  LDI r20, 0x4000
  LDI r21, 40
  LDI r4, 0
clr_ast:
  STORE r20, r4
  ADDI r20, 1
  SUBI r21, 1
  JNZ r21, clr_ast
  ; Mark all asteroid slots as empty (size=255)
  LDI r20, 0x4000
  LDI r21, 8
  LDI r4, 255
mk_empty:
  MOV r22, r20
  ADDI r22, 4
  STORE r22, r4
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
  LDI r13, 0x2007
  LOAD r4, r13
  ADDI r4, 1
  LDI r9, 8
  CMP r4, r9
  BLT r12, sw_ok
  LDI r4, 8
sw_ok:
  MOV r21, r4
  LDI r13, 0x200C
  STORE r13, r4
sw_lp:
  JZ r21, sw_done
  ; Find empty asteroid slot
  LDI r22, 0
sw_find:
  CMPI r22, 40
  BLT r12, sw_chk
  JMP sw_done
sw_chk:
  LDI r23, 0x4000
  ADD r23, r22
  ADDI r23, 4
  LOAD r24, r23
  CMPI r24, 255
  JZ r12, sw_found
  ADDI r22, 5
  JMP sw_find
sw_found:
  ; Spawn asteroid at slot r22
  LDI r23, 0x4000
  ADD r23, r22
  ; Random position on edges
  RAND r4
  ANDI r4, 0xFF
  CMPI r4, 32
  BLT r12, sx_ok
  CMPI r4, 224
  BLT r12, sx_ok2
  LDI r4, 32
  JMP sx_done
sx_ok2:
  LDI r4, 224
  JMP sx_done
sx_ok:
  RAND r5
  ANDI r5, 0xFF
  CMPI r5, 32
  BLT r12, sy_ok
  CMPI r5, 224
  BLT r12, sy_ok2
  LDI r5, 32
  JMP sy_done
sy_ok2:
  LDI r5, 224
  JMP sy_done
sy_ok:
sy_done:
sx_done:
  ; Random velocity (-2 to +1)
  RAND r2
  ANDI r2, 3
  LDI r9, 1
  SUB r2, r9
  RAND r8
  ANDI r8, 3
  SUB r8, r9
  ; Store asteroid
  STORE r23, r4
  LDI r23, 0x4000
  ADD r23, r22
  ADDI r23, 1
  STORE r23, r5
  ADDI r23, 1
  STORE r23, r2
  ADDI r23, 1
  STORE r23, r8
  ADDI r23, 1
  LDI r4, 0
  STORE r23, r4
  ; Increment ast_count
  LDI r13, 0x200C
  LOAD r4, r13
  ADDI r4, 1
  STORE r13, r4
  SUBI r21, 1
  JMP sw_lp
sw_done:
  RET

; ── MAIN GAME LOOP ─────────────────────────────────────
game_loop:
  LDI r13, 0x2008
  LOAD r4, r13
  JNZ r4, game_over
  ; Read input
  IKEY r1
  CMPI r1, 65
  JZ r12, rot_l
  CMPI r1, 97
  JZ r12, rot_l
  CMPI r1, 68
  JZ r12, rot_r
  CMPI r1, 100
  JZ r12, rot_r
  CMPI r1, 87
  JZ r12, do_thrust
  CMPI r1, 119
  JZ r12, do_thrust
  CMPI r1, 32
  JZ r12, do_shoot
  JMP no_input
rot_l:
  LDI r13, 0x2002
  LOAD r4, r13
  ADDI r4, 240
  ANDI r4, 0xFF
  STORE r13, r4
  JMP no_input
rot_r:
  LDI r13, 0x2002
  LOAD r4, r13
  ADDI r4, 16
  ANDI r4, 0xFF
  STORE r13, r4
  JMP no_input
do_thrust:
  ; Add velocity in ship's facing direction
  LDI r13, 0x2002
  LOAD r16, r13
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
  SAR r18, r4
  LDI r4, 3
  SAR r18, r4
  SAR r17, r4
  ; Add to velocity
  LDI r13, 0x2003
  LOAD r4, r13
  ADD r4, r18
  STORE r13, r4
  LDI r13, 0x2004
  LOAD r4, r13
  ADD r4, r17
  STORE r13, r4
  JMP no_input
do_shoot:
  ; Check cooldown
  LDI r13, 0x2009
  LOAD r4, r13
  JNZ r4, no_input
  LDI r4, 15
  STORE r13, r4
  ; Get bullet slot index
  LDI r13, 0x200B
  LOAD r22, r13
  SHLI r22, 2
  LDI r23, 0x4200
  ADD r23, r22
  ; Get ship angle
  LDI r13, 0x2002
  LOAD r16, r13
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
  LDI r4, 4
  SAR r18, r4
  SHLI r17, 1
  ADD r17, r17
  SAR r17, r4
  ; Bullet start position = ship pos + direction * 12
  LDI r13, 0x2000
  LOAD r27, r13
  SHLI r18, 1
  ADD r18, r18
  LDI r4, 5
  SAR r18, r4
  ADD r27, r18
  LDI r13, 0x2001
  LOAD r28, r13
  SHLI r17, 1
  ADD r17, r17
  SAR r17, r4
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
  LDI r13, 0x200B
  LOAD r4, r13
  ADDI r4, 1
  ANDI r4, 3
  STORE r13, r4
no_input:
  ; Decrement cooldown
  LDI r13, 0x2009
  LOAD r4, r13
  JZ r4, cd_ok
  SUBI r4, 1
  STORE r13, r4
cd_ok:
  ; Decrement invulnerability
  LDI r13, 0x200A
  LOAD r4, r13
  JZ r4, inv_ok
  SUBI r4, 1
  STORE r13, r4
inv_ok:
  ; Update ship position
  LDI r13, 0x2000
  LOAD r4, r13
  LDI r9, 0x2003
  LOAD r5, r9
  ADD r4, r5
  STORE r13, r4
  LDI r13, 0x2001
  LOAD r4, r13
  LDI r9, 0x2004
  LOAD r5, r9
  ADD r4, r5
  STORE r13, r4
  ; Wrap ship
  CALL wrap_xy_ship
  ; Update bullets
  CALL update_bullets
  ; Update asteroids
  CALL update_asteroids
  ; Check collisions
  CALL check_collisions
  ; Check if all asteroids destroyed -> next wave
  LDI r13, 0x200C
  LOAD r4, r13
  JNZ r4, draw_start
  LDI r13, 0x2007
  LOAD r4, r13
  ADDI r4, 1
  STORE r13, r4
  PUSH r31
  CALL spawn_wave
  POP r31
draw_start:
  ; Clear screen
  LDI r11, 0
  FILL r11
  ; Draw everything
  CALL draw_asteroids
  CALL draw_bullets
  CALL draw_ship
  CALL draw_hud
  FRAME
  JMP game_loop

; ── WRAP SHIP POSITION ─────────────────────────────────
wrap_xy_ship:
  LDI r13, 0x2000
  LOAD r4, r13
  CMPI r4, 256
  BLT r12, ws_y
  SUBI r4, 256
  STORE r13, r4
ws_y:
  LDI r13, 0x2001
  LOAD r4, r13
  CMPI r4, 256
  BLT r12, ws_done
  SUBI r4, 256
  STORE r13, r4
ws_done:
  RET

; ── UPDATE BULLETS ──────────────────────────────────────
update_bullets:
  LDI r20, 0x4200
  LDI r21, 4
ub_lp:
  JZ r21, ub_done
  ; Load bullet: x(r4), y(r5), vx(r2), vy(r13)
  LOAD r4, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r5, r22
  ADDI r22, 1
  LOAD r2, r22
  ADDI r22, 1
  LOAD r13, r22
  ; Check if off screen (x>=256 or y>=256)
  CMPI r4, 256
  BLT r12, ub_ychk
  ; Off screen - mark inactive (set x=0xFFFF)
  LDI r9, 0xFFFF
  STORE r20, r9
  JMP ub_next
ub_ychk:
  CMPI r5, 256
  BLT r12, ub_move
  LDI r9, 0xFFFF
  STORE r20, r9
  JMP ub_next
ub_move:
  ; Update position
  ADD r4, r2
  STORE r20, r4
  MOV r22, r20
  ADDI r22, 1
  ADD r5, r13
  STORE r22, r5
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
  JZ r12, ua_next
  ; Load x(r4), y(r5), vx(r2), vy(r13)
  LOAD r4, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r5, r22
  ADDI r22, 1
  LOAD r2, r22
  ADDI r22, 1
  LOAD r13, r22
  ; Move
  ADD r4, r2
  STORE r20, r4
  MOV r22, r20
  ADDI r22, 1
  ADD r5, r13
  STORE r22, r5
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
  JZ r12, wa_next
  LOAD r4, r20
  CMPI r4, 256
  BLT r12, wa_ay
  SUBI r4, 256
  STORE r20, r4
wa_ay:
  MOV r22, r20
  ADDI r22, 1
  LOAD r4, r22
  CMPI r4, 256
  BLT r12, wa_nx
  SUBI r4, 256
  STORE r22, r4
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
  LOAD r14, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r3, r22
  ; Check if bullet is active (x < 256)
  CMPI r14, 256
  BLT r12, cb_astlp
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
  JZ r12, cb_anext
  ; Load asteroid x, y, size
  LOAD r4, r23
  MOV r25, r23
  ADDI r25, 1
  LOAD r5, r25
  ; Distance squared
  MOV r1, r14
  SUB r1, r4
  MUL r1, r1
  MOV r6, r3
  SUB r6, r5
  MUL r6, r6
  ADD r1, r6
  ; Collision radius depends on size
  CMPI r26, 2
  JZ r12, cb_sz0
  CMPI r26, 1
  JZ r12, cb_sz1
  LDI r9, 900
  CMP r1, r9
  BLT r12, cb_hit
  JMP cb_anext
cb_sz0:
  LDI r9, 625
  CMP r1, r9
  BLT r12, cb_hit
  JMP cb_anext
cb_sz1:
  LDI r9, 400
  CMP r1, r9
  BLT r12, cb_hit
  JMP cb_anext
cb_hit:
  ; Destroy asteroid (set size=255)
  MOV r25, r23
  ADDI r25, 4
  LDI r9, 255
  STORE r25, r9
  ; Deactivate bullet (set x=0xFFFF)
  LDI r9, 0xFFFF
  STORE r20, r9
  ; Add score
  CMPI r26, 2
  JZ r12, cb_sc0
  CMPI r26, 1
  JZ r12, cb_sc1
  LDI r9, 100
  JMP cb_addsc
cb_sc0:
  LDI r9, 25
  JMP cb_addsc
cb_sc1:
  LDI r9, 50
cb_addsc:
  LDI r13, 0x2006
  LOAD r4, r13
  ADD r4, r9
  STORE r13, r4
  ; Decrement ast_count
  LDI r13, 0x200C
  LOAD r4, r13
  SUBI r4, 1
  STORE r13, r4
  ; Split if not small (size != 2)
  CMPI r26, 2
  JZ r12, cb_nosplit
  ; Determine child size
  CMPI r26, 0
  JZ r12, cb_sp_lg
  LDI r4, 2
  JMP cb_do_sp
cb_sp_lg:
  LDI r4, 1
cb_do_sp:
  PUSH r31
  CALL spawn_children
  POP r31
cb_nosplit:
  ; Sound effect
  LDI r0, 440
  LDI r15, 80
  BEEP r0, r15
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
  LDI r13, 0x200A
  LOAD r4, r13
  JNZ r4, cb_done
  ; Load ship x, y
  LDI r13, 0x2000
  LOAD r14, r13
  LDI r13, 0x2001
  LOAD r3, r13
  LDI r23, 0x4000
  LDI r24, 8
cs_lp:
  JZ r24, cb_done
  MOV r25, r23
  ADDI r25, 4
  LOAD r26, r25
  CMPI r26, 255
  JZ r12, cs_next
  LOAD r4, r23
  MOV r25, r23
  ADDI r25, 1
  LOAD r5, r25
  MOV r1, r14
  SUB r1, r4
  MUL r1, r1
  MOV r6, r3
  SUB r6, r5
  MUL r6, r6
  ADD r1, r6
  LDI r9, 484
  CMP r1, r9
  BLT r12, cs_die
  JMP cs_next
cs_die:
  ; Lose a life
  LDI r13, 0x2005
  LOAD r4, r13
  SUBI r4, 1
  STORE r13, r4
  ; Sound
  LDI r0, 220
  LDI r15, 200
  BEEP r0, r15
  ; Check game over
  JNZ r4, cs_over
  ; Respawn at center
  LDI r13, 0x2000
  LDI r4, 128
  STORE r13, r4
  ADDI r13, 1
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 0
  STORE r13, r4
  ADDI r13, 1
  STORE r13, r4
  ADDI r13, 1
  STORE r13, r4
  ; Invulnerability
  LDI r13, 0x200A
  LDI r4, 120
  STORE r13, r4
  JMP cb_done
cs_over:
  LDI r13, 0x2008
  LDI r4, 1
  STORE r13, r4
  JMP cb_done
cs_next:
  ADDI r23, 5
  SUBI r24, 1
  JMP cs_lp
cb_done:
  RET

; ── SPAWN CHILDREN (after asteroid destruction) ──────────
; r4 = asteroid x (from LOAD r4, r23), r5 = asteroid y
; Actually we need to reload - the registers may be clobbered
; Stack: child_size in r4
spawn_children:
  ; Reload parent position from the asteroid slot we just hit
  ; r23 still points to the asteroid base
  LOAD r9, r23
  MOV r22, r23
  ADDI r22, 1
  LOAD r8, r22
  ; Random velocities for child 1
  RAND r5
  ANDI r5, 3
  LDI r2, 1
  SUB r5, r2
  RAND r1
  ANDI r1, 3
  SUB r1, r2
  ; Find empty slot for child 1
  LDI r20, 0x4000
  LDI r21, 8
sp_f1:
  JZ r21, sp_done
  MOV r22, r20
  ADDI r22, 4
  LOAD r23, r22
  CMPI r23, 255
  JZ r12, sp_s1
  ADDI r20, 5
  SUBI r21, 1
  JMP sp_f1
sp_s1:
  STORE r20, r9
  ADDI r20, 1
  STORE r20, r8
  ADDI r20, 1
  STORE r20, r5
  ADDI r20, 1
  STORE r20, r1
  ADDI r20, 1
  STORE r20, r4
  LDI r13, 0x200C
  LOAD r6, r13
  ADDI r6, 1
  STORE r13, r6
  ; Child 2: opposite velocities
  NEG r5
  NEG r1
  LDI r20, 0x4000
  LDI r21, 8
sp_f2:
  JZ r21, sp_done
  MOV r22, r20
  ADDI r22, 4
  LOAD r23, r22
  CMPI r23, 255
  JZ r12, sp_s2
  ADDI r20, 5
  SUBI r21, 1
  JMP sp_f2
sp_s2:
  STORE r20, r9
  ADDI r20, 1
  STORE r20, r8
  ADDI r20, 1
  STORE r20, r5
  ADDI r20, 1
  STORE r20, r1
  ADDI r20, 1
  STORE r20, r4
  LDI r13, 0x200C
  LOAD r6, r13
  ADDI r6, 1
  STORE r13, r6
sp_done:
  RET

; ── DRAW SHIP ───────────────────────────────────────────
draw_ship:
  ; Check invulnerability blink
  LDI r13, 0x200A
  LOAD r4, r13
  JZ r4, ds_draw
  ANDI r4, 8
  JNZ r4, ds_skip
ds_draw:
  ; Load angle
  LDI r13, 0x2002
  LOAD r16, r13
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
  LDI r13, 0x2000
  LOAD r0, r13
  LDI r13, 0x2001
  LOAD r15, r13
  ; Nose: pos + dir * 15
  LDI r19, 15
  MOV r21, r19
  MUL r21, r18
  LDI r22, 7
  SAR r21, r22
  ADD r21, r0
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
  ADD r28, r0
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
  MOV r4, r19
  MUL r4, r27
  SAR r4, r22
  ADD r4, r0
  MOV r5, r19
  MUL r5, r25
  SAR r5, r22
  ADD r5, r15
  ; Draw triangle
  LDI r2, 0x00FF00
  LINE r21, r23, r28, r29, r2
  LINE r28, r29, r4, r5, r2
  LINE r4, r5, r21, r23, r2
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
  JZ r12, da_next
  ; Load x, y, size
  LOAD r4, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r5, r22
  ADDI r22, 4
  LOAD r23, r22
  ; Draw circle based on size
  CMPI r23, 0
  JZ r12, da_large
  CMPI r23, 1
  JZ r12, da_med
  ; small
  LDI r13, 5
  LDI r9, 0x888888
  CIRCLE r4, r5, r13, r9
  JMP da_next
da_large:
  LDI r13, 18
  LDI r9, 0xAAAAAA
  CIRCLE r4, r5, r13, r9
  JMP da_next
da_med:
  LDI r13, 10
  LDI r9, 0xCCCCCC
  CIRCLE r4, r5, r13, r9
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
  LOAD r4, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r5, r22
  ; Only draw if on screen
  CMPI r4, 256
  BLT r12, db_ychk
  JMP db_next
db_ychk:
  CMPI r5, 256
  BLT r12, db_draw
  JMP db_next
db_draw:
  LDI r2, 0xFFFFFF
  PSET r4, r5, r2
db_next:
  ADDI r20, 4
  SUBI r21, 1
  JMP db_lp
db_done:
  RET

; ── DRAW HUD ────────────────────────────────────────────
draw_hud:
  ; Score text
  LDI r13, 0x5000
  LDI r4, 83
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 67
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 79
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 82
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 69
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 58
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 32
  STORE r13, r4
  ADDI r13, 1
  ; Score number (6 digits)
  LDI r9, 0x2006
  LOAD r11, r9
  LDI r8, 100000
  DIV r4, r8
  ADDI r4, 48
  STORE r13, r4
  MOD r11, r8
  ADDI r13, 1
  LDI r8, 10000
  DIV r4, r8
  ADDI r4, 48
  STORE r13, r4
  MOD r11, r8
  ADDI r13, 1
  LDI r8, 1000
  DIV r4, r8
  ADDI r4, 48
  STORE r13, r4
  MOD r11, r8
  ADDI r13, 1
  LDI r8, 100
  DIV r4, r8
  ADDI r4, 48
  STORE r13, r4
  MOD r11, r8
  ADDI r13, 1
  LDI r8, 10
  DIV r4, r8
  ADDI r4, 48
  STORE r13, r4
  MOD r11, r8
  ADDI r11, 48
  ADDI r13, 1
  STORE r13, r11
  ADDI r13, 1
  LDI r4, 0
  STORE r13, r4
  ; Render "SCORE: NNNNNN"
  LDI r14, 2
  LDI r3, 2
  LDI r10, 0x5000
  TEXT r14, r3, r10
  ; Lives text
  LDI r13, 0x5010
  LDI r4, 76
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 73
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 86
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 69
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 83
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 58
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 32
  STORE r13, r4
  ADDI r13, 1
  LDI r9, 0x2005
  LOAD r4, r9
  ADDI r4, 48
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 0
  STORE r13, r4
  LDI r14, 200
  LDI r3, 2
  LDI r10, 0x5010
  TEXT r14, r3, r10
  ; Wave text
  LDI r13, 0x5020
  LDI r4, 87
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 65
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 86
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 69
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 58
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 32
  STORE r13, r4
  ADDI r13, 1
  LDI r9, 0x2007
  LOAD r4, r9
  ADDI r4, 48
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 0
  STORE r13, r4
  LDI r14, 2
  LDI r3, 14
  LDI r10, 0x5020
  TEXT r14, r3, r10
  RET

; ── GAME OVER ───────────────────────────────────────────
game_over:
  LDI r11, 0
  FILL r11
  ; "GAME OVER" text
  LDI r13, 0x5000
  LDI r4, 71
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 65
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 77
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 69
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 32
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 79
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 86
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 69
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 82
  STORE r13, r4
  ADDI r13, 1
  LDI r4, 0
  STORE r13, r4
  LDI r14, 68
  LDI r3, 110
  LDI r10, 0x5000
  TEXT r14, r3, r10
  FRAME
  IKEY r1
  CMPI r1, 82
  JZ r12, restart
  CMPI r1, 114
  JZ r12, restart
  JMP game_over
