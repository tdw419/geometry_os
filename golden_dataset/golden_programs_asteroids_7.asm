; DESCRIPTION: This GeOS assembly code implements a classic Asteroids arcade game. It initializes the game environment, handles player input for ship movement and shooting, updates positions of bullets and asteroids, checks for collisions, spawns new waves of asteroids, and renders the game state including the ship, asteroids, bullets, and HUD. The game includes features like scoring, lives management, wave progression, and a restart option upon game over.

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
  LDI r2, 0
sin_lp:
  CMPI r2, 64
  BLT r4, sq01
  CMPI r2, 192
  BLT r4, sq23
  ; sq45: 192..255 ramp from -126 toward 0
  LDI r19, 256
  SUB r19, r2
  SHLI r19, 1
  NEG r19
  JMP sin_st
sq23:
  ; 64..191 ramp from 126 down to -126
  LDI r19, 128
  SUB r19, r2
  SHLI r19, 1
  JMP sin_st
sq01:
  ; 0..63 ramp from 0 to 126
  MOV r19, r2
  SHLI r19, 1
sin_st:
  MOV r21, r20
  ADD r21, r2
  STORE r21, r19
  ADDI r2, 1
  CMPI r2, 256
  BLT r4, sin_lp
  RET

; ── INIT GAME ───────────────────────────────────────────
; Ship fields: 0x2000=x 0x2001=y 0x2002=ang 0x2003=vx 0x2004=vy
;              0x2005=lives 0x2006=score 0x2007=wave 0x2008=dead
;              0x2009=cooldown 0x200A=invuln 0x200B=bul_idx 0x200C=ast_cnt
init_game:
  LDI r11, 0x2000
  LDI r5, 128
  STORE r11, r5
  ADDI r11, 1
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 0
  STORE r11, r5
  ADDI r11, 1
  STORE r11, r5
  ADDI r11, 1
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 3
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 0
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 1
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 0
  STORE r11, r5
  ADDI r11, 1
  STORE r11, r5
  ADDI r11, 1
  STORE r11, r5
  ADDI r11, 1
  STORE r11, r5
  ADDI r11, 1
  STORE r11, r5
  ; Clear bullets (16 words at 0x4200)
  LDI r20, 0x4200
  LDI r21, 16
  LDI r5, 0
clr_bul:
  STORE r20, r5
  ADDI r20, 1
  SUBI r21, 1
  JNZ r21, clr_bul
  ; Clear asteroids (40 words at 0x4000)
  LDI r20, 0x4000
  LDI r21, 40
  LDI r5, 0
clr_ast:
  STORE r20, r5
  ADDI r20, 1
  SUBI r21, 1
  JNZ r21, clr_ast
  ; Mark all asteroid slots as empty (size=255)
  LDI r20, 0x4000
  LDI r21, 8
  LDI r5, 255
mk_empty:
  MOV r22, r20
  ADDI r22, 4
  STORE r22, r5
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
  LDI r11, 0x2007
  LOAD r5, r11
  ADDI r5, 1
  LDI r8, 8
  CMP r5, r8
  BLT r4, sw_ok
  LDI r5, 8
sw_ok:
  MOV r21, r5
  LDI r11, 0x200C
  STORE r11, r5
sw_lp:
  JZ r21, sw_done
  ; Find empty asteroid slot
  LDI r22, 0
sw_find:
  CMPI r22, 40
  BLT r4, sw_chk
  JMP sw_done
sw_chk:
  LDI r23, 0x4000
  ADD r23, r22
  ADDI r23, 4
  LOAD r24, r23
  CMPI r24, 255
  JZ r4, sw_found
  ADDI r22, 5
  JMP sw_find
sw_found:
  ; Spawn asteroid at slot r22
  LDI r23, 0x4000
  ADD r23, r22
  ; Random position on edges
  RAND r5
  ANDI r5, 0xFF
  CMPI r5, 32
  BLT r4, sx_ok
  CMPI r5, 224
  BLT r4, sx_ok2
  LDI r5, 32
  JMP sx_done
sx_ok2:
  LDI r5, 224
  JMP sx_done
sx_ok:
  RAND r13
  ANDI r13, 0xFF
  CMPI r13, 32
  BLT r4, sy_ok
  CMPI r13, 224
  BLT r4, sy_ok2
  LDI r13, 32
  JMP sy_done
sy_ok2:
  LDI r13, 224
  JMP sy_done
sy_ok:
sy_done:
sx_done:
  ; Random velocity (-2 to +1)
  RAND r9
  ANDI r9, 3
  LDI r8, 1
  SUB r9, r8
  RAND r1
  ANDI r1, 3
  SUB r1, r8
  ; Store asteroid
  STORE r23, r5
  LDI r23, 0x4000
  ADD r23, r22
  ADDI r23, 1
  STORE r23, r13
  ADDI r23, 1
  STORE r23, r9
  ADDI r23, 1
  STORE r23, r1
  ADDI r23, 1
  LDI r5, 0
  STORE r23, r5
  ; Increment ast_count
  LDI r11, 0x200C
  LOAD r5, r11
  ADDI r5, 1
  STORE r11, r5
  SUBI r21, 1
  JMP sw_lp
sw_done:
  RET

; ── MAIN GAME LOOP ─────────────────────────────────────
game_loop:
  LDI r11, 0x2008
  LOAD r5, r11
  JNZ r5, game_over
  ; Read input
  IKEY r0
  CMPI r0, 65
  JZ r4, rot_l
  CMPI r0, 97
  JZ r4, rot_l
  CMPI r0, 68
  JZ r4, rot_r
  CMPI r0, 100
  JZ r4, rot_r
  CMPI r0, 87
  JZ r4, do_thrust
  CMPI r0, 119
  JZ r4, do_thrust
  CMPI r0, 32
  JZ r4, do_shoot
  JMP no_input
rot_l:
  LDI r11, 0x2002
  LOAD r5, r11
  ADDI r5, 240
  ANDI r5, 0xFF
  STORE r11, r5
  JMP no_input
rot_r:
  LDI r11, 0x2002
  LOAD r5, r11
  ADDI r5, 16
  ANDI r5, 0xFF
  STORE r11, r5
  JMP no_input
do_thrust:
  ; Add velocity in ship's facing direction
  LDI r11, 0x2002
  LOAD r16, r11
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
  SAR r18, r5
  LDI r5, 3
  SAR r18, r5
  SAR r17, r5
  ; Add to velocity
  LDI r11, 0x2003
  LOAD r5, r11
  ADD r5, r18
  STORE r11, r5
  LDI r11, 0x2004
  LOAD r5, r11
  ADD r5, r17
  STORE r11, r5
  JMP no_input
do_shoot:
  ; Check cooldown
  LDI r11, 0x2009
  LOAD r5, r11
  JNZ r5, no_input
  LDI r5, 15
  STORE r11, r5
  ; Get bullet slot index
  LDI r11, 0x200B
  LOAD r22, r11
  SHLI r22, 2
  LDI r23, 0x4200
  ADD r23, r22
  ; Get ship angle
  LDI r11, 0x2002
  LOAD r16, r11
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
  LDI r5, 4
  SAR r18, r5
  SHLI r17, 1
  ADD r17, r17
  SAR r17, r5
  ; Bullet start position = ship pos + direction * 12
  LDI r11, 0x2000
  LOAD r27, r11
  SHLI r18, 1
  ADD r18, r18
  LDI r5, 5
  SAR r18, r5
  ADD r27, r18
  LDI r11, 0x2001
  LOAD r28, r11
  SHLI r17, 1
  ADD r17, r17
  SAR r17, r5
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
  LDI r11, 0x200B
  LOAD r5, r11
  ADDI r5, 1
  ANDI r5, 3
  STORE r11, r5
no_input:
  ; Decrement cooldown
  LDI r11, 0x2009
  LOAD r5, r11
  JZ r5, cd_ok
  SUBI r5, 1
  STORE r11, r5
cd_ok:
  ; Decrement invulnerability
  LDI r11, 0x200A
  LOAD r5, r11
  JZ r5, inv_ok
  SUBI r5, 1
  STORE r11, r5
inv_ok:
  ; Update ship position
  LDI r11, 0x2000
  LOAD r5, r11
  LDI r8, 0x2003
  LOAD r13, r8
  ADD r5, r13
  STORE r11, r5
  LDI r11, 0x2001
  LOAD r5, r11
  LDI r8, 0x2004
  LOAD r13, r8
  ADD r5, r13
  STORE r11, r5
  ; Wrap ship
  CALL wrap_xy_ship
  ; Update bullets
  CALL update_bullets
  ; Update asteroids
  CALL update_asteroids
  ; Check collisions
  CALL check_collisions
  ; Check if all asteroids destroyed -> next wave
  LDI r11, 0x200C
  LOAD r5, r11
  JNZ r5, draw_start
  LDI r11, 0x2007
  LOAD r5, r11
  ADDI r5, 1
  STORE r11, r5
  PUSH r31
  CALL spawn_wave
  POP r31
draw_start:
  ; Clear screen
  LDI r14, 0
  FILL r14
  ; Draw everything
  CALL draw_asteroids
  CALL draw_bullets
  CALL draw_ship
  CALL draw_hud
  FRAME
  JMP game_loop

; ── WRAP SHIP POSITION ─────────────────────────────────
wrap_xy_ship:
  LDI r11, 0x2000
  LOAD r5, r11
  CMPI r5, 256
  BLT r4, ws_y
  SUBI r5, 256
  STORE r11, r5
ws_y:
  LDI r11, 0x2001
  LOAD r5, r11
  CMPI r5, 256
  BLT r4, ws_done
  SUBI r5, 256
  STORE r11, r5
ws_done:
  RET

; ── UPDATE BULLETS ──────────────────────────────────────
update_bullets:
  LDI r20, 0x4200
  LDI r21, 4
ub_lp:
  JZ r21, ub_done
  ; Load bullet: x(r5), y(r13), vx(r9), vy(r11)
  LOAD r5, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r13, r22
  ADDI r22, 1
  LOAD r9, r22
  ADDI r22, 1
  LOAD r11, r22
  ; Check if off screen (x>=256 or y>=256)
  CMPI r5, 256
  BLT r4, ub_ychk
  ; Off screen - mark inactive (set x=0xFFFF)
  LDI r8, 0xFFFF
  STORE r20, r8
  JMP ub_next
ub_ychk:
  CMPI r13, 256
  BLT r4, ub_move
  LDI r8, 0xFFFF
  STORE r20, r8
  JMP ub_next
ub_move:
  ; Update position
  ADD r5, r9
  STORE r20, r5
  MOV r22, r20
  ADDI r22, 1
  ADD r13, r11
  STORE r22, r13
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
  JZ r4, ua_next
  ; Load x(r5), y(r13), vx(r9), vy(r11)
  LOAD r5, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r13, r22
  ADDI r22, 1
  LOAD r9, r22
  ADDI r22, 1
  LOAD r11, r22
  ; Move
  ADD r5, r9
  STORE r20, r5
  MOV r22, r20
  ADDI r22, 1
  ADD r13, r11
  STORE r22, r13
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
  JZ r4, wa_next
  LOAD r5, r20
  CMPI r5, 256
  BLT r4, wa_ay
  SUBI r5, 256
  STORE r20, r5
wa_ay:
  MOV r22, r20
  ADDI r22, 1
  LOAD r5, r22
  CMPI r5, 256
  BLT r4, wa_nx
  SUBI r5, 256
  STORE r22, r5
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
  LOAD r2, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r7, r22
  ; Check if bullet is active (x < 256)
  CMPI r2, 256
  BLT r4, cb_astlp
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
  JZ r4, cb_anext
  ; Load asteroid x, y, size
  LOAD r5, r23
  MOV r25, r23
  ADDI r25, 1
  LOAD r13, r25
  ; Distance squared
  MOV r0, r2
  SUB r0, r5
  MUL r0, r0
  MOV r15, r7
  SUB r15, r13
  MUL r15, r15
  ADD r0, r15
  ; Collision radius depends on size
  CMPI r26, 2
  JZ r4, cb_sz0
  CMPI r26, 1
  JZ r4, cb_sz1
  LDI r8, 900
  CMP r0, r8
  BLT r4, cb_hit
  JMP cb_anext
cb_sz0:
  LDI r8, 625
  CMP r0, r8
  BLT r4, cb_hit
  JMP cb_anext
cb_sz1:
  LDI r8, 400
  CMP r0, r8
  BLT r4, cb_hit
  JMP cb_anext
cb_hit:
  ; Destroy asteroid (set size=255)
  MOV r25, r23
  ADDI r25, 4
  LDI r8, 255
  STORE r25, r8
  ; Deactivate bullet (set x=0xFFFF)
  LDI r8, 0xFFFF
  STORE r20, r8
  ; Add score
  CMPI r26, 2
  JZ r4, cb_sc0
  CMPI r26, 1
  JZ r4, cb_sc1
  LDI r8, 100
  JMP cb_addsc
cb_sc0:
  LDI r8, 25
  JMP cb_addsc
cb_sc1:
  LDI r8, 50
cb_addsc:
  LDI r11, 0x2006
  LOAD r5, r11
  ADD r5, r8
  STORE r11, r5
  ; Decrement ast_count
  LDI r11, 0x200C
  LOAD r5, r11
  SUBI r5, 1
  STORE r11, r5
  ; Split if not small (size != 2)
  CMPI r26, 2
  JZ r4, cb_nosplit
  ; Determine child size
  CMPI r26, 0
  JZ r4, cb_sp_lg
  LDI r5, 2
  JMP cb_do_sp
cb_sp_lg:
  LDI r5, 1
cb_do_sp:
  PUSH r31
  CALL spawn_children
  POP r31
cb_nosplit:
  ; Sound effect
  LDI r12, 440
  LDI r6, 80
  BEEP r12, r6
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
  LDI r11, 0x200A
  LOAD r5, r11
  JNZ r5, cb_done
  ; Load ship x, y
  LDI r11, 0x2000
  LOAD r2, r11
  LDI r11, 0x2001
  LOAD r7, r11
  LDI r23, 0x4000
  LDI r24, 8
cs_lp:
  JZ r24, cb_done
  MOV r25, r23
  ADDI r25, 4
  LOAD r26, r25
  CMPI r26, 255
  JZ r4, cs_next
  LOAD r5, r23
  MOV r25, r23
  ADDI r25, 1
  LOAD r13, r25
  MOV r0, r2
  SUB r0, r5
  MUL r0, r0
  MOV r15, r7
  SUB r15, r13
  MUL r15, r15
  ADD r0, r15
  LDI r8, 484
  CMP r0, r8
  BLT r4, cs_die
  JMP cs_next
cs_die:
  ; Lose a life
  LDI r11, 0x2005
  LOAD r5, r11
  SUBI r5, 1
  STORE r11, r5
  ; Sound
  LDI r12, 220
  LDI r6, 200
  BEEP r12, r6
  ; Check game over
  JNZ r5, cs_over
  ; Respawn at center
  LDI r11, 0x2000
  LDI r5, 128
  STORE r11, r5
  ADDI r11, 1
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 0
  STORE r11, r5
  ADDI r11, 1
  STORE r11, r5
  ADDI r11, 1
  STORE r11, r5
  ; Invulnerability
  LDI r11, 0x200A
  LDI r5, 120
  STORE r11, r5
  JMP cb_done
cs_over:
  LDI r11, 0x2008
  LDI r5, 1
  STORE r11, r5
  JMP cb_done
cs_next:
  ADDI r23, 5
  SUBI r24, 1
  JMP cs_lp
cb_done:
  RET

; ── SPAWN CHILDREN (after asteroid destruction) ──────────
; r5 = asteroid x (from LOAD r5, r23), r13 = asteroid y
; Actually we need to reload - the registers may be clobbered
; Stack: child_size in r5
spawn_children:
  ; Reload parent position from the asteroid slot we just hit
  ; r23 still points to the asteroid base
  LOAD r8, r23
  MOV r22, r23
  ADDI r22, 1
  LOAD r1, r22
  ; Random velocities for child 1
  RAND r13
  ANDI r13, 3
  LDI r9, 1
  SUB r13, r9
  RAND r0
  ANDI r0, 3
  SUB r0, r9
  ; Find empty slot for child 1
  LDI r20, 0x4000
  LDI r21, 8
sp_f1:
  JZ r21, sp_done
  MOV r22, r20
  ADDI r22, 4
  LOAD r23, r22
  CMPI r23, 255
  JZ r4, sp_s1
  ADDI r20, 5
  SUBI r21, 1
  JMP sp_f1
sp_s1:
  STORE r20, r8
  ADDI r20, 1
  STORE r20, r1
  ADDI r20, 1
  STORE r20, r13
  ADDI r20, 1
  STORE r20, r0
  ADDI r20, 1
  STORE r20, r5
  LDI r11, 0x200C
  LOAD r15, r11
  ADDI r15, 1
  STORE r11, r15
  ; Child 2: opposite velocities
  NEG r13
  NEG r0
  LDI r20, 0x4000
  LDI r21, 8
sp_f2:
  JZ r21, sp_done
  MOV r22, r20
  ADDI r22, 4
  LOAD r23, r22
  CMPI r23, 255
  JZ r4, sp_s2
  ADDI r20, 5
  SUBI r21, 1
  JMP sp_f2
sp_s2:
  STORE r20, r8
  ADDI r20, 1
  STORE r20, r1
  ADDI r20, 1
  STORE r20, r13
  ADDI r20, 1
  STORE r20, r0
  ADDI r20, 1
  STORE r20, r5
  LDI r11, 0x200C
  LOAD r15, r11
  ADDI r15, 1
  STORE r11, r15
sp_done:
  RET

; ── DRAW SHIP ───────────────────────────────────────────
draw_ship:
  ; Check invulnerability blink
  LDI r11, 0x200A
  LOAD r5, r11
  JZ r5, ds_draw
  ANDI r5, 8
  JNZ r5, ds_skip
ds_draw:
  ; Load angle
  LDI r11, 0x2002
  LOAD r16, r11
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
  LDI r11, 0x2000
  LOAD r12, r11
  LDI r11, 0x2001
  LOAD r6, r11
  ; Nose: pos + dir * 15
  LDI r19, 15
  MOV r21, r19
  MUL r21, r18
  LDI r22, 7
  SAR r21, r22
  ADD r21, r12
  MOV r23, r19
  MUL r23, r17
  SAR r23, r22
  ADD r23, r6
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
  ADD r28, r12
  MOV r29, r19
  MUL r29, r25
  SAR r29, r22
  ADD r29, r6
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
  MOV r5, r19
  MUL r5, r27
  SAR r5, r22
  ADD r5, r12
  MOV r13, r19
  MUL r13, r25
  SAR r13, r22
  ADD r13, r6
  ; Draw triangle
  LDI r9, 0x00FF00
  LINE r21, r23, r28, r29, r9
  LINE r28, r29, r5, r13, r9
  LINE r5, r13, r21, r23, r9
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
  JZ r4, da_next
  ; Load x, y, size
  LOAD r5, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r13, r22
  ADDI r22, 4
  LOAD r23, r22
  ; Draw circle based on size
  CMPI r23, 0
  JZ r4, da_large
  CMPI r23, 1
  JZ r4, da_med
  ; small
  LDI r11, 5
  LDI r8, 0x888888
  CIRCLE r5, r13, r11, r8
  JMP da_next
da_large:
  LDI r11, 18
  LDI r8, 0xAAAAAA
  CIRCLE r5, r13, r11, r8
  JMP da_next
da_med:
  LDI r11, 10
  LDI r8, 0xCCCCCC
  CIRCLE r5, r13, r11, r8
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
  LOAD r5, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r13, r22
  ; Only draw if on screen
  CMPI r5, 256
  BLT r4, db_ychk
  JMP db_next
db_ychk:
  CMPI r13, 256
  BLT r4, db_draw
  JMP db_next
db_draw:
  LDI r9, 0xFFFFFF
  PSET r5, r13, r9
db_next:
  ADDI r20, 4
  SUBI r21, 1
  JMP db_lp
db_done:
  RET

; ── DRAW HUD ────────────────────────────────────────────
draw_hud:
  ; Score text
  LDI r11, 0x5000
  LDI r5, 83
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 67
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 79
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 82
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 69
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 58
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 32
  STORE r11, r5
  ADDI r11, 1
  ; Score number (6 digits)
  LDI r8, 0x2006
  LOAD r14, r8
  LDI r1, 100000
  DIV r5, r1
  ADDI r5, 48
  STORE r11, r5
  MOD r14, r1
  ADDI r11, 1
  LDI r1, 10000
  DIV r5, r1
  ADDI r5, 48
  STORE r11, r5
  MOD r14, r1
  ADDI r11, 1
  LDI r1, 1000
  DIV r5, r1
  ADDI r5, 48
  STORE r11, r5
  MOD r14, r1
  ADDI r11, 1
  LDI r1, 100
  DIV r5, r1
  ADDI r5, 48
  STORE r11, r5
  MOD r14, r1
  ADDI r11, 1
  LDI r1, 10
  DIV r5, r1
  ADDI r5, 48
  STORE r11, r5
  MOD r14, r1
  ADDI r14, 48
  ADDI r11, 1
  STORE r11, r14
  ADDI r11, 1
  LDI r5, 0
  STORE r11, r5
  ; Render "SCORE: NNNNNN"
  LDI r2, 2
  LDI r7, 2
  LDI r3, 0x5000
  TEXT r2, r7, r3
  ; Lives text
  LDI r11, 0x5010
  LDI r5, 76
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 73
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 86
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 69
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 83
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 58
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 32
  STORE r11, r5
  ADDI r11, 1
  LDI r8, 0x2005
  LOAD r5, r8
  ADDI r5, 48
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 0
  STORE r11, r5
  LDI r2, 200
  LDI r7, 2
  LDI r3, 0x5010
  TEXT r2, r7, r3
  ; Wave text
  LDI r11, 0x5020
  LDI r5, 87
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 65
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 86
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 69
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 58
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 32
  STORE r11, r5
  ADDI r11, 1
  LDI r8, 0x2007
  LOAD r5, r8
  ADDI r5, 48
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 0
  STORE r11, r5
  LDI r2, 2
  LDI r7, 14
  LDI r3, 0x5020
  TEXT r2, r7, r3
  RET

; ── GAME OVER ───────────────────────────────────────────
game_over:
  LDI r14, 0
  FILL r14
  ; "GAME OVER" text
  LDI r11, 0x5000
  LDI r5, 71
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 65
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 77
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 69
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 32
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 79
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 86
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 69
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 82
  STORE r11, r5
  ADDI r11, 1
  LDI r5, 0
  STORE r11, r5
  LDI r2, 68
  LDI r7, 110
  LDI r3, 0x5000
  TEXT r2, r7, r3
  FRAME
  IKEY r0
  CMPI r0, 82
  JZ r4, restart
  CMPI r0, 114
  JZ r4, restart
  JMP game_over
