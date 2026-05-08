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
  LDI r10, 0
sin_lp:
  CMPI r10, 64
  BLT r2, sq01
  CMPI r10, 192
  BLT r2, sq23
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
  BLT r2, sin_lp
  RET

; ── INIT GAME ───────────────────────────────────────────
; Ship fields: 0x2000=x 0x2001=y 0x2002=ang 0x2003=vx 0x2004=vy
;              0x2005=lives 0x2006=score 0x2007=wave 0x2008=dead
;              0x2009=cooldown 0x200A=invuln 0x200B=bul_idx 0x200C=ast_cnt
init_game:
  LDI r12, 0x2000
  LDI r3, 128
  STORE r12, r3
  ADDI r12, 1
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 0
  STORE r12, r3
  ADDI r12, 1
  STORE r12, r3
  ADDI r12, 1
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 3
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 0
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 1
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 0
  STORE r12, r3
  ADDI r12, 1
  STORE r12, r3
  ADDI r12, 1
  STORE r12, r3
  ADDI r12, 1
  STORE r12, r3
  ADDI r12, 1
  STORE r12, r3
  ; Clear bullets (16 words at 0x4200)
  LDI r20, 0x4200
  LDI r21, 16
  LDI r3, 0
clr_bul:
  STORE r20, r3
  ADDI r20, 1
  SUBI r21, 1
  JNZ r21, clr_bul
  ; Clear asteroids (40 words at 0x4000)
  LDI r20, 0x4000
  LDI r21, 40
  LDI r3, 0
clr_ast:
  STORE r20, r3
  ADDI r20, 1
  SUBI r21, 1
  JNZ r21, clr_ast
  ; Mark all asteroid slots as empty (size=255)
  LDI r20, 0x4000
  LDI r21, 8
  LDI r3, 255
mk_empty:
  MOV r22, r20
  ADDI r22, 4
  STORE r22, r3
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
  LDI r12, 0x2007
  LOAD r3, r12
  ADDI r3, 1
  LDI r13, 8
  CMP r3, r13
  BLT r2, sw_ok
  LDI r3, 8
sw_ok:
  MOV r21, r3
  LDI r12, 0x200C
  STORE r12, r3
sw_lp:
  JZ r21, sw_done
  ; Find empty asteroid slot
  LDI r22, 0
sw_find:
  CMPI r22, 40
  BLT r2, sw_chk
  JMP sw_done
sw_chk:
  LDI r23, 0x4000
  ADD r23, r22
  ADDI r23, 4
  LOAD r24, r23
  CMPI r24, 255
  JZ r2, sw_found
  ADDI r22, 5
  JMP sw_find
sw_found:
  ; Spawn asteroid at slot r22
  LDI r23, 0x4000
  ADD r23, r22
  ; Random position on edges
  RAND r3
  ANDI r3, 0xFF
  CMPI r3, 32
  BLT r2, sx_ok
  CMPI r3, 224
  BLT r2, sx_ok2
  LDI r3, 32
  JMP sx_done
sx_ok2:
  LDI r3, 224
  JMP sx_done
sx_ok:
  RAND r5
  ANDI r5, 0xFF
  CMPI r5, 32
  BLT r2, sy_ok
  CMPI r5, 224
  BLT r2, sy_ok2
  LDI r5, 32
  JMP sy_done
sy_ok2:
  LDI r5, 224
  JMP sy_done
sy_ok:
sy_done:
sx_done:
  ; Random velocity (-2 to +1)
  RAND r11
  ANDI r11, 3
  LDI r13, 1
  SUB r11, r13
  RAND r7
  ANDI r7, 3
  SUB r7, r13
  ; Store asteroid
  STORE r23, r3
  LDI r23, 0x4000
  ADD r23, r22
  ADDI r23, 1
  STORE r23, r5
  ADDI r23, 1
  STORE r23, r11
  ADDI r23, 1
  STORE r23, r7
  ADDI r23, 1
  LDI r3, 0
  STORE r23, r3
  ; Increment ast_count
  LDI r12, 0x200C
  LOAD r3, r12
  ADDI r3, 1
  STORE r12, r3
  SUBI r21, 1
  JMP sw_lp
sw_done:
  RET

; ── MAIN GAME LOOP ─────────────────────────────────────
game_loop:
  LDI r12, 0x2008
  LOAD r3, r12
  JNZ r3, game_over
  ; Read input
  IKEY r0
  CMPI r0, 65
  JZ r2, rot_l
  CMPI r0, 97
  JZ r2, rot_l
  CMPI r0, 68
  JZ r2, rot_r
  CMPI r0, 100
  JZ r2, rot_r
  CMPI r0, 87
  JZ r2, do_thrust
  CMPI r0, 119
  JZ r2, do_thrust
  CMPI r0, 32
  JZ r2, do_shoot
  JMP no_input
rot_l:
  LDI r12, 0x2002
  LOAD r3, r12
  ADDI r3, 240
  ANDI r3, 0xFF
  STORE r12, r3
  JMP no_input
rot_r:
  LDI r12, 0x2002
  LOAD r3, r12
  ADDI r3, 16
  ANDI r3, 0xFF
  STORE r12, r3
  JMP no_input
do_thrust:
  ; Add velocity in ship's facing direction
  LDI r12, 0x2002
  LOAD r16, r12
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
  SAR r18, r3
  LDI r3, 3
  SAR r18, r3
  SAR r17, r3
  ; Add to velocity
  LDI r12, 0x2003
  LOAD r3, r12
  ADD r3, r18
  STORE r12, r3
  LDI r12, 0x2004
  LOAD r3, r12
  ADD r3, r17
  STORE r12, r3
  JMP no_input
do_shoot:
  ; Check cooldown
  LDI r12, 0x2009
  LOAD r3, r12
  JNZ r3, no_input
  LDI r3, 15
  STORE r12, r3
  ; Get bullet slot index
  LDI r12, 0x200B
  LOAD r22, r12
  SHLI r22, 2
  LDI r23, 0x4200
  ADD r23, r22
  ; Get ship angle
  LDI r12, 0x2002
  LOAD r16, r12
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
  LDI r3, 4
  SAR r18, r3
  SHLI r17, 1
  ADD r17, r17
  SAR r17, r3
  ; Bullet start position = ship pos + direction * 12
  LDI r12, 0x2000
  LOAD r27, r12
  SHLI r18, 1
  ADD r18, r18
  LDI r3, 5
  SAR r18, r3
  ADD r27, r18
  LDI r12, 0x2001
  LOAD r28, r12
  SHLI r17, 1
  ADD r17, r17
  SAR r17, r3
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
  LDI r12, 0x200B
  LOAD r3, r12
  ADDI r3, 1
  ANDI r3, 3
  STORE r12, r3
no_input:
  ; Decrement cooldown
  LDI r12, 0x2009
  LOAD r3, r12
  JZ r3, cd_ok
  SUBI r3, 1
  STORE r12, r3
cd_ok:
  ; Decrement invulnerability
  LDI r12, 0x200A
  LOAD r3, r12
  JZ r3, inv_ok
  SUBI r3, 1
  STORE r12, r3
inv_ok:
  ; Update ship position
  LDI r12, 0x2000
  LOAD r3, r12
  LDI r13, 0x2003
  LOAD r5, r13
  ADD r3, r5
  STORE r12, r3
  LDI r12, 0x2001
  LOAD r3, r12
  LDI r13, 0x2004
  LOAD r5, r13
  ADD r3, r5
  STORE r12, r3
  ; Wrap ship
  CALL wrap_xy_ship
  ; Update bullets
  CALL update_bullets
  ; Update asteroids
  CALL update_asteroids
  ; Check collisions
  CALL check_collisions
  ; Check if all asteroids destroyed -> next wave
  LDI r12, 0x200C
  LOAD r3, r12
  JNZ r3, draw_start
  LDI r12, 0x2007
  LOAD r3, r12
  ADDI r3, 1
  STORE r12, r3
  PUSH r31
  CALL spawn_wave
  POP r31
draw_start:
  ; Clear screen
  LDI r15, 0
  FILL r15
  ; Draw everything
  CALL draw_asteroids
  CALL draw_bullets
  CALL draw_ship
  CALL draw_hud
  FRAME
  JMP game_loop

; ── WRAP SHIP POSITION ─────────────────────────────────
wrap_xy_ship:
  LDI r12, 0x2000
  LOAD r3, r12
  CMPI r3, 256
  BLT r2, ws_y
  SUBI r3, 256
  STORE r12, r3
ws_y:
  LDI r12, 0x2001
  LOAD r3, r12
  CMPI r3, 256
  BLT r2, ws_done
  SUBI r3, 256
  STORE r12, r3
ws_done:
  RET

; ── UPDATE BULLETS ──────────────────────────────────────
update_bullets:
  LDI r20, 0x4200
  LDI r21, 4
ub_lp:
  JZ r21, ub_done
  ; Load bullet: x(r3), y(r5), vx(r11), vy(r12)
  LOAD r3, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r5, r22
  ADDI r22, 1
  LOAD r11, r22
  ADDI r22, 1
  LOAD r12, r22
  ; Check if off screen (x>=256 or y>=256)
  CMPI r3, 256
  BLT r2, ub_ychk
  ; Off screen - mark inactive (set x=0xFFFF)
  LDI r13, 0xFFFF
  STORE r20, r13
  JMP ub_next
ub_ychk:
  CMPI r5, 256
  BLT r2, ub_move
  LDI r13, 0xFFFF
  STORE r20, r13
  JMP ub_next
ub_move:
  ; Update position
  ADD r3, r11
  STORE r20, r3
  MOV r22, r20
  ADDI r22, 1
  ADD r5, r12
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
  JZ r2, ua_next
  ; Load x(r3), y(r5), vx(r11), vy(r12)
  LOAD r3, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r5, r22
  ADDI r22, 1
  LOAD r11, r22
  ADDI r22, 1
  LOAD r12, r22
  ; Move
  ADD r3, r11
  STORE r20, r3
  MOV r22, r20
  ADDI r22, 1
  ADD r5, r12
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
  JZ r2, wa_next
  LOAD r3, r20
  CMPI r3, 256
  BLT r2, wa_ay
  SUBI r3, 256
  STORE r20, r3
wa_ay:
  MOV r22, r20
  ADDI r22, 1
  LOAD r3, r22
  CMPI r3, 256
  BLT r2, wa_nx
  SUBI r3, 256
  STORE r22, r3
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
  LOAD r1, r22
  ; Check if bullet is active (x < 256)
  CMPI r10, 256
  BLT r2, cb_astlp
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
  JZ r2, cb_anext
  ; Load asteroid x, y, size
  LOAD r3, r23
  MOV r25, r23
  ADDI r25, 1
  LOAD r5, r25
  ; Distance squared
  MOV r0, r10
  SUB r0, r3
  MUL r0, r0
  MOV r14, r1
  SUB r14, r5
  MUL r14, r14
  ADD r0, r14
  ; Collision radius depends on size
  CMPI r26, 2
  JZ r2, cb_sz0
  CMPI r26, 1
  JZ r2, cb_sz1
  LDI r13, 900
  CMP r0, r13
  BLT r2, cb_hit
  JMP cb_anext
cb_sz0:
  LDI r13, 625
  CMP r0, r13
  BLT r2, cb_hit
  JMP cb_anext
cb_sz1:
  LDI r13, 400
  CMP r0, r13
  BLT r2, cb_hit
  JMP cb_anext
cb_hit:
  ; Destroy asteroid (set size=255)
  MOV r25, r23
  ADDI r25, 4
  LDI r13, 255
  STORE r25, r13
  ; Deactivate bullet (set x=0xFFFF)
  LDI r13, 0xFFFF
  STORE r20, r13
  ; Add score
  CMPI r26, 2
  JZ r2, cb_sc0
  CMPI r26, 1
  JZ r2, cb_sc1
  LDI r13, 100
  JMP cb_addsc
cb_sc0:
  LDI r13, 25
  JMP cb_addsc
cb_sc1:
  LDI r13, 50
cb_addsc:
  LDI r12, 0x2006
  LOAD r3, r12
  ADD r3, r13
  STORE r12, r3
  ; Decrement ast_count
  LDI r12, 0x200C
  LOAD r3, r12
  SUBI r3, 1
  STORE r12, r3
  ; Split if not small (size != 2)
  CMPI r26, 2
  JZ r2, cb_nosplit
  ; Determine child size
  CMPI r26, 0
  JZ r2, cb_sp_lg
  LDI r3, 2
  JMP cb_do_sp
cb_sp_lg:
  LDI r3, 1
cb_do_sp:
  PUSH r31
  CALL spawn_children
  POP r31
cb_nosplit:
  ; Sound effect
  LDI r8, 440
  LDI r4, 80
  BEEP r8, r4
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
  LDI r12, 0x200A
  LOAD r3, r12
  JNZ r3, cb_done
  ; Load ship x, y
  LDI r12, 0x2000
  LOAD r10, r12
  LDI r12, 0x2001
  LOAD r1, r12
  LDI r23, 0x4000
  LDI r24, 8
cs_lp:
  JZ r24, cb_done
  MOV r25, r23
  ADDI r25, 4
  LOAD r26, r25
  CMPI r26, 255
  JZ r2, cs_next
  LOAD r3, r23
  MOV r25, r23
  ADDI r25, 1
  LOAD r5, r25
  MOV r0, r10
  SUB r0, r3
  MUL r0, r0
  MOV r14, r1
  SUB r14, r5
  MUL r14, r14
  ADD r0, r14
  LDI r13, 484
  CMP r0, r13
  BLT r2, cs_die
  JMP cs_next
cs_die:
  ; Lose a life
  LDI r12, 0x2005
  LOAD r3, r12
  SUBI r3, 1
  STORE r12, r3
  ; Sound
  LDI r8, 220
  LDI r4, 200
  BEEP r8, r4
  ; Check game over
  JNZ r3, cs_over
  ; Respawn at center
  LDI r12, 0x2000
  LDI r3, 128
  STORE r12, r3
  ADDI r12, 1
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 0
  STORE r12, r3
  ADDI r12, 1
  STORE r12, r3
  ADDI r12, 1
  STORE r12, r3
  ; Invulnerability
  LDI r12, 0x200A
  LDI r3, 120
  STORE r12, r3
  JMP cb_done
cs_over:
  LDI r12, 0x2008
  LDI r3, 1
  STORE r12, r3
  JMP cb_done
cs_next:
  ADDI r23, 5
  SUBI r24, 1
  JMP cs_lp
cb_done:
  RET

; ── SPAWN CHILDREN (after asteroid destruction) ──────────
; r3 = asteroid x (from LOAD r3, r23), r5 = asteroid y
; Actually we need to reload - the registers may be clobbered
; Stack: child_size in r3
spawn_children:
  ; Reload parent position from the asteroid slot we just hit
  ; r23 still points to the asteroid base
  LOAD r13, r23
  MOV r22, r23
  ADDI r22, 1
  LOAD r7, r22
  ; Random velocities for child 1
  RAND r5
  ANDI r5, 3
  LDI r11, 1
  SUB r5, r11
  RAND r0
  ANDI r0, 3
  SUB r0, r11
  ; Find empty slot for child 1
  LDI r20, 0x4000
  LDI r21, 8
sp_f1:
  JZ r21, sp_done
  MOV r22, r20
  ADDI r22, 4
  LOAD r23, r22
  CMPI r23, 255
  JZ r2, sp_s1
  ADDI r20, 5
  SUBI r21, 1
  JMP sp_f1
sp_s1:
  STORE r20, r13
  ADDI r20, 1
  STORE r20, r7
  ADDI r20, 1
  STORE r20, r5
  ADDI r20, 1
  STORE r20, r0
  ADDI r20, 1
  STORE r20, r3
  LDI r12, 0x200C
  LOAD r14, r12
  ADDI r14, 1
  STORE r12, r14
  ; Child 2: opposite velocities
  NEG r5
  NEG r0
  LDI r20, 0x4000
  LDI r21, 8
sp_f2:
  JZ r21, sp_done
  MOV r22, r20
  ADDI r22, 4
  LOAD r23, r22
  CMPI r23, 255
  JZ r2, sp_s2
  ADDI r20, 5
  SUBI r21, 1
  JMP sp_f2
sp_s2:
  STORE r20, r13
  ADDI r20, 1
  STORE r20, r7
  ADDI r20, 1
  STORE r20, r5
  ADDI r20, 1
  STORE r20, r0
  ADDI r20, 1
  STORE r20, r3
  LDI r12, 0x200C
  LOAD r14, r12
  ADDI r14, 1
  STORE r12, r14
sp_done:
  RET

; ── DRAW SHIP ───────────────────────────────────────────
draw_ship:
  ; Check invulnerability blink
  LDI r12, 0x200A
  LOAD r3, r12
  JZ r3, ds_draw
  ANDI r3, 8
  JNZ r3, ds_skip
ds_draw:
  ; Load angle
  LDI r12, 0x2002
  LOAD r16, r12
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
  LDI r12, 0x2000
  LOAD r8, r12
  LDI r12, 0x2001
  LOAD r4, r12
  ; Nose: pos + dir * 15
  LDI r19, 15
  MOV r21, r19
  MUL r21, r18
  LDI r22, 7
  SAR r21, r22
  ADD r21, r8
  MOV r23, r19
  MUL r23, r17
  SAR r23, r22
  ADD r23, r4
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
  ADD r28, r8
  MOV r29, r19
  MUL r29, r25
  SAR r29, r22
  ADD r29, r4
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
  MOV r3, r19
  MUL r3, r27
  SAR r3, r22
  ADD r3, r8
  MOV r5, r19
  MUL r5, r25
  SAR r5, r22
  ADD r5, r4
  ; Draw triangle
  LDI r11, 0x00FF00
  LINE r21, r23, r28, r29, r11
  LINE r28, r29, r3, r5, r11
  LINE r3, r5, r21, r23, r11
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
  JZ r2, da_next
  ; Load x, y, size
  LOAD r3, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r5, r22
  ADDI r22, 4
  LOAD r23, r22
  ; Draw circle based on size
  CMPI r23, 0
  JZ r2, da_large
  CMPI r23, 1
  JZ r2, da_med
  ; small
  LDI r12, 5
  LDI r13, 0x888888
  CIRCLE r3, r5, r12, r13
  JMP da_next
da_large:
  LDI r12, 18
  LDI r13, 0xAAAAAA
  CIRCLE r3, r5, r12, r13
  JMP da_next
da_med:
  LDI r12, 10
  LDI r13, 0xCCCCCC
  CIRCLE r3, r5, r12, r13
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
  LOAD r3, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r5, r22
  ; Only draw if on screen
  CMPI r3, 256
  BLT r2, db_ychk
  JMP db_next
db_ychk:
  CMPI r5, 256
  BLT r2, db_draw
  JMP db_next
db_draw:
  LDI r11, 0xFFFFFF
  PSET r3, r5, r11
db_next:
  ADDI r20, 4
  SUBI r21, 1
  JMP db_lp
db_done:
  RET

; ── DRAW HUD ────────────────────────────────────────────
draw_hud:
  ; Score text
  LDI r12, 0x5000
  LDI r3, 83
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 67
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 79
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 82
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 69
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 58
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 32
  STORE r12, r3
  ADDI r12, 1
  ; Score number (6 digits)
  LDI r13, 0x2006
  LOAD r15, r13
  LDI r7, 100000
  DIV r3, r7
  ADDI r3, 48
  STORE r12, r3
  MOD r15, r7
  ADDI r12, 1
  LDI r7, 10000
  DIV r3, r7
  ADDI r3, 48
  STORE r12, r3
  MOD r15, r7
  ADDI r12, 1
  LDI r7, 1000
  DIV r3, r7
  ADDI r3, 48
  STORE r12, r3
  MOD r15, r7
  ADDI r12, 1
  LDI r7, 100
  DIV r3, r7
  ADDI r3, 48
  STORE r12, r3
  MOD r15, r7
  ADDI r12, 1
  LDI r7, 10
  DIV r3, r7
  ADDI r3, 48
  STORE r12, r3
  MOD r15, r7
  ADDI r15, 48
  ADDI r12, 1
  STORE r12, r15
  ADDI r12, 1
  LDI r3, 0
  STORE r12, r3
  ; Render "SCORE: NNNNNN"
  LDI r10, 2
  LDI r1, 2
  LDI r9, 0x5000
  TEXT r10, r1, r9
  ; Lives text
  LDI r12, 0x5010
  LDI r3, 76
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 73
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 86
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 69
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 83
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 58
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 32
  STORE r12, r3
  ADDI r12, 1
  LDI r13, 0x2005
  LOAD r3, r13
  ADDI r3, 48
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 0
  STORE r12, r3
  LDI r10, 200
  LDI r1, 2
  LDI r9, 0x5010
  TEXT r10, r1, r9
  ; Wave text
  LDI r12, 0x5020
  LDI r3, 87
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 65
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 86
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 69
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 58
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 32
  STORE r12, r3
  ADDI r12, 1
  LDI r13, 0x2007
  LOAD r3, r13
  ADDI r3, 48
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 0
  STORE r12, r3
  LDI r10, 2
  LDI r1, 14
  LDI r9, 0x5020
  TEXT r10, r1, r9
  RET

; ── GAME OVER ───────────────────────────────────────────
game_over:
  LDI r15, 0
  FILL r15
  ; "GAME OVER" text
  LDI r12, 0x5000
  LDI r3, 71
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 65
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 77
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 69
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 32
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 79
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 86
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 69
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 82
  STORE r12, r3
  ADDI r12, 1
  LDI r3, 0
  STORE r12, r3
  LDI r10, 68
  LDI r1, 110
  LDI r9, 0x5000
  TEXT r10, r1, r9
  FRAME
  IKEY r0
  CMPI r0, 82
  JZ r2, restart
  CMPI r0, 114
  JZ r2, restart
  JMP game_over
