; DESCRIPTION: Geometry OS program to draw a colored object.

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
  LDI r4, 0
sin_lp:
  CMPI r4, 64
  BLT r5, sq01
  CMPI r4, 192
  BLT r5, sq23
  ; sq45: 192..255 ramp from -126 toward 0
  LDI r19, 256
  SUB r19, r4
  SHLI r19, 1
  NEG r19
  JMP sin_st
sq23:
  ; 64..191 ramp from 126 down to -126
  LDI r19, 128
  SUB r19, r4
  SHLI r19, 1
  JMP sin_st
sq01:
  ; 0..63 ramp from 0 to 126
  MOV r19, r4
  SHLI r19, 1
sin_st:
  MOV r21, r20
  ADD r21, r4
  STORE r21, r19
  ADDI r4, 1
  CMPI r4, 256
  BLT r5, sin_lp
  RET

; ── INIT GAME ───────────────────────────────────────────
; Ship fields: 0x2000=x 0x2001=y 0x2002=ang 0x2003=vx 0x2004=vy
;              0x2005=lives 0x2006=score 0x2007=wave 0x2008=dead
;              0x2009=cooldown 0x200A=invuln 0x200B=bul_idx 0x200C=ast_cnt
init_game:
  LDI r0, 0x2000
  LDI r10, 128
  STORE r0, r10
  ADDI r0, 1
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 0
  STORE r0, r10
  ADDI r0, 1
  STORE r0, r10
  ADDI r0, 1
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 3
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 0
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 1
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 0
  STORE r0, r10
  ADDI r0, 1
  STORE r0, r10
  ADDI r0, 1
  STORE r0, r10
  ADDI r0, 1
  STORE r0, r10
  ADDI r0, 1
  STORE r0, r10
  ; Clear bullets (16 words at 0x4200)
  LDI r20, 0x4200
  LDI r21, 16
  LDI r10, 0
clr_bul:
  STORE r20, r10
  ADDI r20, 1
  SUBI r21, 1
  JNZ r21, clr_bul
  ; Clear asteroids (40 words at 0x4000)
  LDI r20, 0x4000
  LDI r21, 40
  LDI r10, 0
clr_ast:
  STORE r20, r10
  ADDI r20, 1
  SUBI r21, 1
  JNZ r21, clr_ast
  ; Mark all asteroid slots as empty (size=255)
  LDI r20, 0x4000
  LDI r21, 8
  LDI r10, 255
mk_empty:
  MOV r22, r20
  ADDI r22, 4
  STORE r22, r10
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
  LDI r0, 0x2007
  LOAD r10, r0
  ADDI r10, 1
  LDI r6, 8
  CMP r10, r6
  BLT r5, sw_ok
  LDI r10, 8
sw_ok:
  MOV r21, r10
  LDI r0, 0x200C
  STORE r0, r10
sw_lp:
  JZ r21, sw_done
  ; Find empty asteroid slot
  LDI r22, 0
sw_find:
  CMPI r22, 40
  BLT r5, sw_chk
  JMP sw_done
sw_chk:
  LDI r23, 0x4000
  ADD r23, r22
  ADDI r23, 4
  LOAD r24, r23
  CMPI r24, 255
  JZ r5, sw_found
  ADDI r22, 5
  JMP sw_find
sw_found:
  ; Spawn asteroid at slot r22
  LDI r23, 0x4000
  ADD r23, r22
  ; Random position on edges
  RAND r10
  ANDI r10, 0xFF
  CMPI r10, 32
  BLT r5, sx_ok
  CMPI r10, 224
  BLT r5, sx_ok2
  LDI r10, 32
  JMP sx_done
sx_ok2:
  LDI r10, 224
  JMP sx_done
sx_ok:
  RAND r3
  ANDI r3, 0xFF
  CMPI r3, 32
  BLT r5, sy_ok
  CMPI r3, 224
  BLT r5, sy_ok2
  LDI r3, 32
  JMP sy_done
sy_ok2:
  LDI r3, 224
  JMP sy_done
sy_ok:
sy_done:
sx_done:
  ; Random velocity (-2 to +1)
  RAND r13
  ANDI r13, 3
  LDI r6, 1
  SUB r13, r6
  RAND r14
  ANDI r14, 3
  SUB r14, r6
  ; Store asteroid
  STORE r23, r10
  LDI r23, 0x4000
  ADD r23, r22
  ADDI r23, 1
  STORE r23, r3
  ADDI r23, 1
  STORE r23, r13
  ADDI r23, 1
  STORE r23, r14
  ADDI r23, 1
  LDI r10, 0
  STORE r23, r10
  ; Increment ast_count
  LDI r0, 0x200C
  LOAD r10, r0
  ADDI r10, 1
  STORE r0, r10
  SUBI r21, 1
  JMP sw_lp
sw_done:
  RET

; ── MAIN GAME LOOP ─────────────────────────────────────
game_loop:
  LDI r0, 0x2008
  LOAD r10, r0
  JNZ r10, game_over
  ; Read input
  IKEY r12
  CMPI r12, 65
  JZ r5, rot_l
  CMPI r12, 97
  JZ r5, rot_l
  CMPI r12, 68
  JZ r5, rot_r
  CMPI r12, 100
  JZ r5, rot_r
  CMPI r12, 87
  JZ r5, do_thrust
  CMPI r12, 119
  JZ r5, do_thrust
  CMPI r12, 32
  JZ r5, do_shoot
  JMP no_input
rot_l:
  LDI r0, 0x2002
  LOAD r10, r0
  ADDI r10, 240
  ANDI r10, 0xFF
  STORE r0, r10
  JMP no_input
rot_r:
  LDI r0, 0x2002
  LOAD r10, r0
  ADDI r10, 16
  ANDI r10, 0xFF
  STORE r0, r10
  JMP no_input
do_thrust:
  ; Add velocity in ship's facing direction
  LDI r0, 0x2002
  LOAD r16, r0
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
  SAR r18, r10
  LDI r10, 3
  SAR r18, r10
  SAR r17, r10
  ; Add to velocity
  LDI r0, 0x2003
  LOAD r10, r0
  ADD r10, r18
  STORE r0, r10
  LDI r0, 0x2004
  LOAD r10, r0
  ADD r10, r17
  STORE r0, r10
  JMP no_input
do_shoot:
  ; Check cooldown
  LDI r0, 0x2009
  LOAD r10, r0
  JNZ r10, no_input
  LDI r10, 15
  STORE r0, r10
  ; Get bullet slot index
  LDI r0, 0x200B
  LOAD r22, r0
  SHLI r22, 2
  LDI r23, 0x4200
  ADD r23, r22
  ; Get ship angle
  LDI r0, 0x2002
  LOAD r16, r0
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
  LDI r10, 4
  SAR r18, r10
  SHLI r17, 1
  ADD r17, r17
  SAR r17, r10
  ; Bullet start position = ship pos + direction * 12
  LDI r0, 0x2000
  LOAD r27, r0
  SHLI r18, 1
  ADD r18, r18
  LDI r10, 5
  SAR r18, r10
  ADD r27, r18
  LDI r0, 0x2001
  LOAD r28, r0
  SHLI r17, 1
  ADD r17, r17
  SAR r17, r10
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
  LDI r0, 0x200B
  LOAD r10, r0
  ADDI r10, 1
  ANDI r10, 3
  STORE r0, r10
no_input:
  ; Decrement cooldown
  LDI r0, 0x2009
  LOAD r10, r0
  JZ r10, cd_ok
  SUBI r10, 1
  STORE r0, r10
cd_ok:
  ; Decrement invulnerability
  LDI r0, 0x200A
  LOAD r10, r0
  JZ r10, inv_ok
  SUBI r10, 1
  STORE r0, r10
inv_ok:
  ; Update ship position
  LDI r0, 0x2000
  LOAD r10, r0
  LDI r6, 0x2003
  LOAD r3, r6
  ADD r10, r3
  STORE r0, r10
  LDI r0, 0x2001
  LOAD r10, r0
  LDI r6, 0x2004
  LOAD r3, r6
  ADD r10, r3
  STORE r0, r10
  ; Wrap ship
  CALL wrap_xy_ship
  ; Update bullets
  CALL update_bullets
  ; Update asteroids
  CALL update_asteroids
  ; Check collisions
  CALL check_collisions
  ; Check if all asteroids destroyed -> next wave
  LDI r0, 0x200C
  LOAD r10, r0
  JNZ r10, draw_start
  LDI r0, 0x2007
  LOAD r10, r0
  ADDI r10, 1
  STORE r0, r10
  PUSH r31
  CALL spawn_wave
  POP r31
draw_start:
  ; Clear screen
  LDI r7, 0
  FILL r7
  ; Draw everything
  CALL draw_asteroids
  CALL draw_bullets
  CALL draw_ship
  CALL draw_hud
  FRAME
  JMP game_loop

; ── WRAP SHIP POSITION ─────────────────────────────────
wrap_xy_ship:
  LDI r0, 0x2000
  LOAD r10, r0
  CMPI r10, 256
  BLT r5, ws_y
  SUBI r10, 256
  STORE r0, r10
ws_y:
  LDI r0, 0x2001
  LOAD r10, r0
  CMPI r10, 256
  BLT r5, ws_done
  SUBI r10, 256
  STORE r0, r10
ws_done:
  RET

; ── UPDATE BULLETS ──────────────────────────────────────
update_bullets:
  LDI r20, 0x4200
  LDI r21, 4
ub_lp:
  JZ r21, ub_done
  ; Load bullet: x(r10), y(r3), vx(r13), vy(r0)
  LOAD r10, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r3, r22
  ADDI r22, 1
  LOAD r13, r22
  ADDI r22, 1
  LOAD r0, r22
  ; Check if off screen (x>=256 or y>=256)
  CMPI r10, 256
  BLT r5, ub_ychk
  ; Off screen - mark inactive (set x=0xFFFF)
  LDI r6, 0xFFFF
  STORE r20, r6
  JMP ub_next
ub_ychk:
  CMPI r3, 256
  BLT r5, ub_move
  LDI r6, 0xFFFF
  STORE r20, r6
  JMP ub_next
ub_move:
  ; Update position
  ADD r10, r13
  STORE r20, r10
  MOV r22, r20
  ADDI r22, 1
  ADD r3, r0
  STORE r22, r3
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
  JZ r5, ua_next
  ; Load x(r10), y(r3), vx(r13), vy(r0)
  LOAD r10, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r3, r22
  ADDI r22, 1
  LOAD r13, r22
  ADDI r22, 1
  LOAD r0, r22
  ; Move
  ADD r10, r13
  STORE r20, r10
  MOV r22, r20
  ADDI r22, 1
  ADD r3, r0
  STORE r22, r3
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
  JZ r5, wa_next
  LOAD r10, r20
  CMPI r10, 256
  BLT r5, wa_ay
  SUBI r10, 256
  STORE r20, r10
wa_ay:
  MOV r22, r20
  ADDI r22, 1
  LOAD r10, r22
  CMPI r10, 256
  BLT r5, wa_nx
  SUBI r10, 256
  STORE r22, r10
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
  LOAD r4, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r9, r22
  ; Check if bullet is active (x < 256)
  CMPI r4, 256
  BLT r5, cb_astlp
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
  JZ r5, cb_anext
  ; Load asteroid x, y, size
  LOAD r10, r23
  MOV r25, r23
  ADDI r25, 1
  LOAD r3, r25
  ; Distance squared
  MOV r12, r4
  SUB r12, r10
  MUL r12, r12
  MOV r11, r9
  SUB r11, r3
  MUL r11, r11
  ADD r12, r11
  ; Collision radius depends on size
  CMPI r26, 2
  JZ r5, cb_sz0
  CMPI r26, 1
  JZ r5, cb_sz1
  LDI r6, 900
  CMP r12, r6
  BLT r5, cb_hit
  JMP cb_anext
cb_sz0:
  LDI r6, 625
  CMP r12, r6
  BLT r5, cb_hit
  JMP cb_anext
cb_sz1:
  LDI r6, 400
  CMP r12, r6
  BLT r5, cb_hit
  JMP cb_anext
cb_hit:
  ; Destroy asteroid (set size=255)
  MOV r25, r23
  ADDI r25, 4
  LDI r6, 255
  STORE r25, r6
  ; Deactivate bullet (set x=0xFFFF)
  LDI r6, 0xFFFF
  STORE r20, r6
  ; Add score
  CMPI r26, 2
  JZ r5, cb_sc0
  CMPI r26, 1
  JZ r5, cb_sc1
  LDI r6, 100
  JMP cb_addsc
cb_sc0:
  LDI r6, 25
  JMP cb_addsc
cb_sc1:
  LDI r6, 50
cb_addsc:
  LDI r0, 0x2006
  LOAD r10, r0
  ADD r10, r6
  STORE r0, r10
  ; Decrement ast_count
  LDI r0, 0x200C
  LOAD r10, r0
  SUBI r10, 1
  STORE r0, r10
  ; Split if not small (size != 2)
  CMPI r26, 2
  JZ r5, cb_nosplit
  ; Determine child size
  CMPI r26, 0
  JZ r5, cb_sp_lg
  LDI r10, 2
  JMP cb_do_sp
cb_sp_lg:
  LDI r10, 1
cb_do_sp:
  PUSH r31
  CALL spawn_children
  POP r31
cb_nosplit:
  ; Sound effect
  LDI r1, 440
  LDI r8, 80
  BEEP r1, r8
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
  LDI r0, 0x200A
  LOAD r10, r0
  JNZ r10, cb_done
  ; Load ship x, y
  LDI r0, 0x2000
  LOAD r4, r0
  LDI r0, 0x2001
  LOAD r9, r0
  LDI r23, 0x4000
  LDI r24, 8
cs_lp:
  JZ r24, cb_done
  MOV r25, r23
  ADDI r25, 4
  LOAD r26, r25
  CMPI r26, 255
  JZ r5, cs_next
  LOAD r10, r23
  MOV r25, r23
  ADDI r25, 1
  LOAD r3, r25
  MOV r12, r4
  SUB r12, r10
  MUL r12, r12
  MOV r11, r9
  SUB r11, r3
  MUL r11, r11
  ADD r12, r11
  LDI r6, 484
  CMP r12, r6
  BLT r5, cs_die
  JMP cs_next
cs_die:
  ; Lose a life
  LDI r0, 0x2005
  LOAD r10, r0
  SUBI r10, 1
  STORE r0, r10
  ; Sound
  LDI r1, 220
  LDI r8, 200
  BEEP r1, r8
  ; Check game over
  JNZ r10, cs_over
  ; Respawn at center
  LDI r0, 0x2000
  LDI r10, 128
  STORE r0, r10
  ADDI r0, 1
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 0
  STORE r0, r10
  ADDI r0, 1
  STORE r0, r10
  ADDI r0, 1
  STORE r0, r10
  ; Invulnerability
  LDI r0, 0x200A
  LDI r10, 120
  STORE r0, r10
  JMP cb_done
cs_over:
  LDI r0, 0x2008
  LDI r10, 1
  STORE r0, r10
  JMP cb_done
cs_next:
  ADDI r23, 5
  SUBI r24, 1
  JMP cs_lp
cb_done:
  RET

; ── SPAWN CHILDREN (after asteroid destruction) ──────────
; r10 = asteroid x (from LOAD r10, r23), r3 = asteroid y
; Actually we need to reload - the registers may be clobbered
; Stack: child_size in r10
spawn_children:
  ; Reload parent position from the asteroid slot we just hit
  ; r23 still points to the asteroid base
  LOAD r6, r23
  MOV r22, r23
  ADDI r22, 1
  LOAD r14, r22
  ; Random velocities for child 1
  RAND r3
  ANDI r3, 3
  LDI r13, 1
  SUB r3, r13
  RAND r12
  ANDI r12, 3
  SUB r12, r13
  ; Find empty slot for child 1
  LDI r20, 0x4000
  LDI r21, 8
sp_f1:
  JZ r21, sp_done
  MOV r22, r20
  ADDI r22, 4
  LOAD r23, r22
  CMPI r23, 255
  JZ r5, sp_s1
  ADDI r20, 5
  SUBI r21, 1
  JMP sp_f1
sp_s1:
  STORE r20, r6
  ADDI r20, 1
  STORE r20, r14
  ADDI r20, 1
  STORE r20, r3
  ADDI r20, 1
  STORE r20, r12
  ADDI r20, 1
  STORE r20, r10
  LDI r0, 0x200C
  LOAD r11, r0
  ADDI r11, 1
  STORE r0, r11
  ; Child 2: opposite velocities
  NEG r3
  NEG r12
  LDI r20, 0x4000
  LDI r21, 8
sp_f2:
  JZ r21, sp_done
  MOV r22, r20
  ADDI r22, 4
  LOAD r23, r22
  CMPI r23, 255
  JZ r5, sp_s2
  ADDI r20, 5
  SUBI r21, 1
  JMP sp_f2
sp_s2:
  STORE r20, r6
  ADDI r20, 1
  STORE r20, r14
  ADDI r20, 1
  STORE r20, r3
  ADDI r20, 1
  STORE r20, r12
  ADDI r20, 1
  STORE r20, r10
  LDI r0, 0x200C
  LOAD r11, r0
  ADDI r11, 1
  STORE r0, r11
sp_done:
  RET

; ── DRAW SHIP ───────────────────────────────────────────
draw_ship:
  ; Check invulnerability blink
  LDI r0, 0x200A
  LOAD r10, r0
  JZ r10, ds_draw
  ANDI r10, 8
  JNZ r10, ds_skip
ds_draw:
  ; Load angle
  LDI r0, 0x2002
  LOAD r16, r0
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
  LDI r0, 0x2000
  LOAD r1, r0
  LDI r0, 0x2001
  LOAD r8, r0
  ; Nose: pos + dir * 15
  LDI r19, 15
  MOV r21, r19
  MUL r21, r18
  LDI r22, 7
  SAR r21, r22
  ADD r21, r1
  MOV r23, r19
  MUL r23, r17
  SAR r23, r22
  ADD r23, r8
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
  ADD r28, r1
  MOV r29, r19
  MUL r29, r25
  SAR r29, r22
  ADD r29, r8
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
  MOV r10, r19
  MUL r10, r27
  SAR r10, r22
  ADD r10, r1
  MOV r3, r19
  MUL r3, r25
  SAR r3, r22
  ADD r3, r8
  ; Draw triangle
  LDI r13, 0x00FF00
  LINE r21, r23, r28, r29, r13
  LINE r28, r29, r10, r3, r13
  LINE r10, r3, r21, r23, r13
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
  JZ r5, da_next
  ; Load x, y, size
  LOAD r10, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r3, r22
  ADDI r22, 4
  LOAD r23, r22
  ; Draw circle based on size
  CMPI r23, 0
  JZ r5, da_large
  CMPI r23, 1
  JZ r5, da_med
  ; small
  LDI r0, 5
  LDI r6, 0x888888
  CIRCLE r10, r3, r0, r6
  JMP da_next
da_large:
  LDI r0, 18
  LDI r6, 0xAAAAAA
  CIRCLE r10, r3, r0, r6
  JMP da_next
da_med:
  LDI r0, 10
  LDI r6, 0xCCCCCC
  CIRCLE r10, r3, r0, r6
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
  LOAD r10, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r3, r22
  ; Only draw if on screen
  CMPI r10, 256
  BLT r5, db_ychk
  JMP db_next
db_ychk:
  CMPI r3, 256
  BLT r5, db_draw
  JMP db_next
db_draw:
  LDI r13, 0xFFFFFF
  PSET r10, r3, r13
db_next:
  ADDI r20, 4
  SUBI r21, 1
  JMP db_lp
db_done:
  RET

; ── DRAW HUD ────────────────────────────────────────────
draw_hud:
  ; Score text
  LDI r0, 0x5000
  LDI r10, 83
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 67
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 79
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 82
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 69
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 58
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 32
  STORE r0, r10
  ADDI r0, 1
  ; Score number (6 digits)
  LDI r6, 0x2006
  LOAD r7, r6
  LDI r14, 100000
  DIV r10, r14
  ADDI r10, 48
  STORE r0, r10
  MOD r7, r14
  ADDI r0, 1
  LDI r14, 10000
  DIV r10, r14
  ADDI r10, 48
  STORE r0, r10
  MOD r7, r14
  ADDI r0, 1
  LDI r14, 1000
  DIV r10, r14
  ADDI r10, 48
  STORE r0, r10
  MOD r7, r14
  ADDI r0, 1
  LDI r14, 100
  DIV r10, r14
  ADDI r10, 48
  STORE r0, r10
  MOD r7, r14
  ADDI r0, 1
  LDI r14, 10
  DIV r10, r14
  ADDI r10, 48
  STORE r0, r10
  MOD r7, r14
  ADDI r7, 48
  ADDI r0, 1
  STORE r0, r7
  ADDI r0, 1
  LDI r10, 0
  STORE r0, r10
  ; Render "SCORE: NNNNNN"
  LDI r4, 2
  LDI r9, 2
  LDI r2, 0x5000
  TEXT r4, r9, r2
  ; Lives text
  LDI r0, 0x5010
  LDI r10, 76
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 73
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 86
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 69
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 83
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 58
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 32
  STORE r0, r10
  ADDI r0, 1
  LDI r6, 0x2005
  LOAD r10, r6
  ADDI r10, 48
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 0
  STORE r0, r10
  LDI r4, 200
  LDI r9, 2
  LDI r2, 0x5010
  TEXT r4, r9, r2
  ; Wave text
  LDI r0, 0x5020
  LDI r10, 87
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 65
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 86
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 69
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 58
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 32
  STORE r0, r10
  ADDI r0, 1
  LDI r6, 0x2007
  LOAD r10, r6
  ADDI r10, 48
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 0
  STORE r0, r10
  LDI r4, 2
  LDI r9, 14
  LDI r2, 0x5020
  TEXT r4, r9, r2
  RET

; ── GAME OVER ───────────────────────────────────────────
game_over:
  LDI r7, 0
  FILL r7
  ; "GAME OVER" text
  LDI r0, 0x5000
  LDI r10, 71
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 65
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 77
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 69
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 32
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 79
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 86
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 69
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 82
  STORE r0, r10
  ADDI r0, 1
  LDI r10, 0
  STORE r0, r10
  LDI r4, 68
  LDI r9, 110
  LDI r2, 0x5000
  TEXT r4, r9, r2
  FRAME
  IKEY r12
  CMPI r12, 82
  JZ r5, restart
  CMPI r12, 114
  JZ r5, restart
  JMP game_over
