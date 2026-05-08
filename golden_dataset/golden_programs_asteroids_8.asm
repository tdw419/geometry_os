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
  BLT r14, sq01
  CMPI r10, 192
  BLT r14, sq23
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
  BLT r14, sin_lp
  RET

; ── INIT GAME ───────────────────────────────────────────
; Ship fields: 0x2000=x 0x2001=y 0x2002=ang 0x2003=vx 0x2004=vy
;              0x2005=lives 0x2006=score 0x2007=wave 0x2008=dead
;              0x2009=cooldown 0x200A=invuln 0x200B=bul_idx 0x200C=ast_cnt
init_game:
  LDI r0, 0x2000
  LDI r11, 128
  STORE r0, r11
  ADDI r0, 1
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 0
  STORE r0, r11
  ADDI r0, 1
  STORE r0, r11
  ADDI r0, 1
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 3
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 0
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 1
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 0
  STORE r0, r11
  ADDI r0, 1
  STORE r0, r11
  ADDI r0, 1
  STORE r0, r11
  ADDI r0, 1
  STORE r0, r11
  ADDI r0, 1
  STORE r0, r11
  ; Clear bullets (16 words at 0x4200)
  LDI r20, 0x4200
  LDI r21, 16
  LDI r11, 0
clr_bul:
  STORE r20, r11
  ADDI r20, 1
  SUBI r21, 1
  JNZ r21, clr_bul
  ; Clear asteroids (40 words at 0x4000)
  LDI r20, 0x4000
  LDI r21, 40
  LDI r11, 0
clr_ast:
  STORE r20, r11
  ADDI r20, 1
  SUBI r21, 1
  JNZ r21, clr_ast
  ; Mark all asteroid slots as empty (size=255)
  LDI r20, 0x4000
  LDI r21, 8
  LDI r11, 255
mk_empty:
  MOV r22, r20
  ADDI r22, 4
  STORE r22, r11
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
  LOAD r11, r0
  ADDI r11, 1
  LDI r6, 8
  CMP r11, r6
  BLT r14, sw_ok
  LDI r11, 8
sw_ok:
  MOV r21, r11
  LDI r0, 0x200C
  STORE r0, r11
sw_lp:
  JZ r21, sw_done
  ; Find empty asteroid slot
  LDI r22, 0
sw_find:
  CMPI r22, 40
  BLT r14, sw_chk
  JMP sw_done
sw_chk:
  LDI r23, 0x4000
  ADD r23, r22
  ADDI r23, 4
  LOAD r24, r23
  CMPI r24, 255
  JZ r14, sw_found
  ADDI r22, 5
  JMP sw_find
sw_found:
  ; Spawn asteroid at slot r22
  LDI r23, 0x4000
  ADD r23, r22
  ; Random position on edges
  RAND r11
  ANDI r11, 0xFF
  CMPI r11, 32
  BLT r14, sx_ok
  CMPI r11, 224
  BLT r14, sx_ok2
  LDI r11, 32
  JMP sx_done
sx_ok2:
  LDI r11, 224
  JMP sx_done
sx_ok:
  RAND r3
  ANDI r3, 0xFF
  CMPI r3, 32
  BLT r14, sy_ok
  CMPI r3, 224
  BLT r14, sy_ok2
  LDI r3, 32
  JMP sy_done
sy_ok2:
  LDI r3, 224
  JMP sy_done
sy_ok:
sy_done:
sx_done:
  ; Random velocity (-2 to +1)
  RAND r1
  ANDI r1, 3
  LDI r6, 1
  SUB r1, r6
  RAND r8
  ANDI r8, 3
  SUB r8, r6
  ; Store asteroid
  STORE r23, r11
  LDI r23, 0x4000
  ADD r23, r22
  ADDI r23, 1
  STORE r23, r3
  ADDI r23, 1
  STORE r23, r1
  ADDI r23, 1
  STORE r23, r8
  ADDI r23, 1
  LDI r11, 0
  STORE r23, r11
  ; Increment ast_count
  LDI r0, 0x200C
  LOAD r11, r0
  ADDI r11, 1
  STORE r0, r11
  SUBI r21, 1
  JMP sw_lp
sw_done:
  RET

; ── MAIN GAME LOOP ─────────────────────────────────────
game_loop:
  LDI r0, 0x2008
  LOAD r11, r0
  JNZ r11, game_over
  ; Read input
  IKEY r9
  CMPI r9, 65
  JZ r14, rot_l
  CMPI r9, 97
  JZ r14, rot_l
  CMPI r9, 68
  JZ r14, rot_r
  CMPI r9, 100
  JZ r14, rot_r
  CMPI r9, 87
  JZ r14, do_thrust
  CMPI r9, 119
  JZ r14, do_thrust
  CMPI r9, 32
  JZ r14, do_shoot
  JMP no_input
rot_l:
  LDI r0, 0x2002
  LOAD r11, r0
  ADDI r11, 240
  ANDI r11, 0xFF
  STORE r0, r11
  JMP no_input
rot_r:
  LDI r0, 0x2002
  LOAD r11, r0
  ADDI r11, 16
  ANDI r11, 0xFF
  STORE r0, r11
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
  SAR r18, r11
  LDI r11, 3
  SAR r18, r11
  SAR r17, r11
  ; Add to velocity
  LDI r0, 0x2003
  LOAD r11, r0
  ADD r11, r18
  STORE r0, r11
  LDI r0, 0x2004
  LOAD r11, r0
  ADD r11, r17
  STORE r0, r11
  JMP no_input
do_shoot:
  ; Check cooldown
  LDI r0, 0x2009
  LOAD r11, r0
  JNZ r11, no_input
  LDI r11, 15
  STORE r0, r11
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
  LDI r11, 4
  SAR r18, r11
  SHLI r17, 1
  ADD r17, r17
  SAR r17, r11
  ; Bullet start position = ship pos + direction * 12
  LDI r0, 0x2000
  LOAD r27, r0
  SHLI r18, 1
  ADD r18, r18
  LDI r11, 5
  SAR r18, r11
  ADD r27, r18
  LDI r0, 0x2001
  LOAD r28, r0
  SHLI r17, 1
  ADD r17, r17
  SAR r17, r11
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
  LOAD r11, r0
  ADDI r11, 1
  ANDI r11, 3
  STORE r0, r11
no_input:
  ; Decrement cooldown
  LDI r0, 0x2009
  LOAD r11, r0
  JZ r11, cd_ok
  SUBI r11, 1
  STORE r0, r11
cd_ok:
  ; Decrement invulnerability
  LDI r0, 0x200A
  LOAD r11, r0
  JZ r11, inv_ok
  SUBI r11, 1
  STORE r0, r11
inv_ok:
  ; Update ship position
  LDI r0, 0x2000
  LOAD r11, r0
  LDI r6, 0x2003
  LOAD r3, r6
  ADD r11, r3
  STORE r0, r11
  LDI r0, 0x2001
  LOAD r11, r0
  LDI r6, 0x2004
  LOAD r3, r6
  ADD r11, r3
  STORE r0, r11
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
  LOAD r11, r0
  JNZ r11, draw_start
  LDI r0, 0x2007
  LOAD r11, r0
  ADDI r11, 1
  STORE r0, r11
  PUSH r31
  CALL spawn_wave
  POP r31
draw_start:
  ; Clear screen
  LDI r4, 0
  FILL r4
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
  LOAD r11, r0
  CMPI r11, 256
  BLT r14, ws_y
  SUBI r11, 256
  STORE r0, r11
ws_y:
  LDI r0, 0x2001
  LOAD r11, r0
  CMPI r11, 256
  BLT r14, ws_done
  SUBI r11, 256
  STORE r0, r11
ws_done:
  RET

; ── UPDATE BULLETS ──────────────────────────────────────
update_bullets:
  LDI r20, 0x4200
  LDI r21, 4
ub_lp:
  JZ r21, ub_done
  ; Load bullet: x(r11), y(r3), vx(r1), vy(r0)
  LOAD r11, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r3, r22
  ADDI r22, 1
  LOAD r1, r22
  ADDI r22, 1
  LOAD r0, r22
  ; Check if off screen (x>=256 or y>=256)
  CMPI r11, 256
  BLT r14, ub_ychk
  ; Off screen - mark inactive (set x=0xFFFF)
  LDI r6, 0xFFFF
  STORE r20, r6
  JMP ub_next
ub_ychk:
  CMPI r3, 256
  BLT r14, ub_move
  LDI r6, 0xFFFF
  STORE r20, r6
  JMP ub_next
ub_move:
  ; Update position
  ADD r11, r1
  STORE r20, r11
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
  JZ r14, ua_next
  ; Load x(r11), y(r3), vx(r1), vy(r0)
  LOAD r11, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r3, r22
  ADDI r22, 1
  LOAD r1, r22
  ADDI r22, 1
  LOAD r0, r22
  ; Move
  ADD r11, r1
  STORE r20, r11
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
  JZ r14, wa_next
  LOAD r11, r20
  CMPI r11, 256
  BLT r14, wa_ay
  SUBI r11, 256
  STORE r20, r11
wa_ay:
  MOV r22, r20
  ADDI r22, 1
  LOAD r11, r22
  CMPI r11, 256
  BLT r14, wa_nx
  SUBI r11, 256
  STORE r22, r11
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
  LOAD r2, r22
  ; Check if bullet is active (x < 256)
  CMPI r10, 256
  BLT r14, cb_astlp
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
  JZ r14, cb_anext
  ; Load asteroid x, y, size
  LOAD r11, r23
  MOV r25, r23
  ADDI r25, 1
  LOAD r3, r25
  ; Distance squared
  MOV r9, r10
  SUB r9, r11
  MUL r9, r9
  MOV r7, r2
  SUB r7, r3
  MUL r7, r7
  ADD r9, r7
  ; Collision radius depends on size
  CMPI r26, 2
  JZ r14, cb_sz0
  CMPI r26, 1
  JZ r14, cb_sz1
  LDI r6, 900
  CMP r9, r6
  BLT r14, cb_hit
  JMP cb_anext
cb_sz0:
  LDI r6, 625
  CMP r9, r6
  BLT r14, cb_hit
  JMP cb_anext
cb_sz1:
  LDI r6, 400
  CMP r9, r6
  BLT r14, cb_hit
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
  JZ r14, cb_sc0
  CMPI r26, 1
  JZ r14, cb_sc1
  LDI r6, 100
  JMP cb_addsc
cb_sc0:
  LDI r6, 25
  JMP cb_addsc
cb_sc1:
  LDI r6, 50
cb_addsc:
  LDI r0, 0x2006
  LOAD r11, r0
  ADD r11, r6
  STORE r0, r11
  ; Decrement ast_count
  LDI r0, 0x200C
  LOAD r11, r0
  SUBI r11, 1
  STORE r0, r11
  ; Split if not small (size != 2)
  CMPI r26, 2
  JZ r14, cb_nosplit
  ; Determine child size
  CMPI r26, 0
  JZ r14, cb_sp_lg
  LDI r11, 2
  JMP cb_do_sp
cb_sp_lg:
  LDI r11, 1
cb_do_sp:
  PUSH r31
  CALL spawn_children
  POP r31
cb_nosplit:
  ; Sound effect
  LDI r5, 440
  LDI r13, 80
  BEEP r5, r13
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
  LOAD r11, r0
  JNZ r11, cb_done
  ; Load ship x, y
  LDI r0, 0x2000
  LOAD r10, r0
  LDI r0, 0x2001
  LOAD r2, r0
  LDI r23, 0x4000
  LDI r24, 8
cs_lp:
  JZ r24, cb_done
  MOV r25, r23
  ADDI r25, 4
  LOAD r26, r25
  CMPI r26, 255
  JZ r14, cs_next
  LOAD r11, r23
  MOV r25, r23
  ADDI r25, 1
  LOAD r3, r25
  MOV r9, r10
  SUB r9, r11
  MUL r9, r9
  MOV r7, r2
  SUB r7, r3
  MUL r7, r7
  ADD r9, r7
  LDI r6, 484
  CMP r9, r6
  BLT r14, cs_die
  JMP cs_next
cs_die:
  ; Lose a life
  LDI r0, 0x2005
  LOAD r11, r0
  SUBI r11, 1
  STORE r0, r11
  ; Sound
  LDI r5, 220
  LDI r13, 200
  BEEP r5, r13
  ; Check game over
  JNZ r11, cs_over
  ; Respawn at center
  LDI r0, 0x2000
  LDI r11, 128
  STORE r0, r11
  ADDI r0, 1
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 0
  STORE r0, r11
  ADDI r0, 1
  STORE r0, r11
  ADDI r0, 1
  STORE r0, r11
  ; Invulnerability
  LDI r0, 0x200A
  LDI r11, 120
  STORE r0, r11
  JMP cb_done
cs_over:
  LDI r0, 0x2008
  LDI r11, 1
  STORE r0, r11
  JMP cb_done
cs_next:
  ADDI r23, 5
  SUBI r24, 1
  JMP cs_lp
cb_done:
  RET

; ── SPAWN CHILDREN (after asteroid destruction) ──────────
; r11 = asteroid x (from LOAD r11, r23), r3 = asteroid y
; Actually we need to reload - the registers may be clobbered
; Stack: child_size in r11
spawn_children:
  ; Reload parent position from the asteroid slot we just hit
  ; r23 still points to the asteroid base
  LOAD r6, r23
  MOV r22, r23
  ADDI r22, 1
  LOAD r8, r22
  ; Random velocities for child 1
  RAND r3
  ANDI r3, 3
  LDI r1, 1
  SUB r3, r1
  RAND r9
  ANDI r9, 3
  SUB r9, r1
  ; Find empty slot for child 1
  LDI r20, 0x4000
  LDI r21, 8
sp_f1:
  JZ r21, sp_done
  MOV r22, r20
  ADDI r22, 4
  LOAD r23, r22
  CMPI r23, 255
  JZ r14, sp_s1
  ADDI r20, 5
  SUBI r21, 1
  JMP sp_f1
sp_s1:
  STORE r20, r6
  ADDI r20, 1
  STORE r20, r8
  ADDI r20, 1
  STORE r20, r3
  ADDI r20, 1
  STORE r20, r9
  ADDI r20, 1
  STORE r20, r11
  LDI r0, 0x200C
  LOAD r7, r0
  ADDI r7, 1
  STORE r0, r7
  ; Child 2: opposite velocities
  NEG r3
  NEG r9
  LDI r20, 0x4000
  LDI r21, 8
sp_f2:
  JZ r21, sp_done
  MOV r22, r20
  ADDI r22, 4
  LOAD r23, r22
  CMPI r23, 255
  JZ r14, sp_s2
  ADDI r20, 5
  SUBI r21, 1
  JMP sp_f2
sp_s2:
  STORE r20, r6
  ADDI r20, 1
  STORE r20, r8
  ADDI r20, 1
  STORE r20, r3
  ADDI r20, 1
  STORE r20, r9
  ADDI r20, 1
  STORE r20, r11
  LDI r0, 0x200C
  LOAD r7, r0
  ADDI r7, 1
  STORE r0, r7
sp_done:
  RET

; ── DRAW SHIP ───────────────────────────────────────────
draw_ship:
  ; Check invulnerability blink
  LDI r0, 0x200A
  LOAD r11, r0
  JZ r11, ds_draw
  ANDI r11, 8
  JNZ r11, ds_skip
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
  LOAD r5, r0
  LDI r0, 0x2001
  LOAD r13, r0
  ; Nose: pos + dir * 15
  LDI r19, 15
  MOV r21, r19
  MUL r21, r18
  LDI r22, 7
  SAR r21, r22
  ADD r21, r5
  MOV r23, r19
  MUL r23, r17
  SAR r23, r22
  ADD r23, r13
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
  ADD r28, r5
  MOV r29, r19
  MUL r29, r25
  SAR r29, r22
  ADD r29, r13
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
  MOV r11, r19
  MUL r11, r27
  SAR r11, r22
  ADD r11, r5
  MOV r3, r19
  MUL r3, r25
  SAR r3, r22
  ADD r3, r13
  ; Draw triangle
  LDI r1, 0x00FF00
  LINE r21, r23, r28, r29, r1
  LINE r28, r29, r11, r3, r1
  LINE r11, r3, r21, r23, r1
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
  JZ r14, da_next
  ; Load x, y, size
  LOAD r11, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r3, r22
  ADDI r22, 4
  LOAD r23, r22
  ; Draw circle based on size
  CMPI r23, 0
  JZ r14, da_large
  CMPI r23, 1
  JZ r14, da_med
  ; small
  LDI r0, 5
  LDI r6, 0x888888
  CIRCLE r11, r3, r0, r6
  JMP da_next
da_large:
  LDI r0, 18
  LDI r6, 0xAAAAAA
  CIRCLE r11, r3, r0, r6
  JMP da_next
da_med:
  LDI r0, 10
  LDI r6, 0xCCCCCC
  CIRCLE r11, r3, r0, r6
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
  LOAD r11, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r3, r22
  ; Only draw if on screen
  CMPI r11, 256
  BLT r14, db_ychk
  JMP db_next
db_ychk:
  CMPI r3, 256
  BLT r14, db_draw
  JMP db_next
db_draw:
  LDI r1, 0xFFFFFF
  PSET r11, r3, r1
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
  LDI r11, 83
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 67
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 79
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 82
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 69
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 58
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 32
  STORE r0, r11
  ADDI r0, 1
  ; Score number (6 digits)
  LDI r6, 0x2006
  LOAD r4, r6
  LDI r8, 100000
  DIV r11, r8
  ADDI r11, 48
  STORE r0, r11
  MOD r4, r8
  ADDI r0, 1
  LDI r8, 10000
  DIV r11, r8
  ADDI r11, 48
  STORE r0, r11
  MOD r4, r8
  ADDI r0, 1
  LDI r8, 1000
  DIV r11, r8
  ADDI r11, 48
  STORE r0, r11
  MOD r4, r8
  ADDI r0, 1
  LDI r8, 100
  DIV r11, r8
  ADDI r11, 48
  STORE r0, r11
  MOD r4, r8
  ADDI r0, 1
  LDI r8, 10
  DIV r11, r8
  ADDI r11, 48
  STORE r0, r11
  MOD r4, r8
  ADDI r4, 48
  ADDI r0, 1
  STORE r0, r4
  ADDI r0, 1
  LDI r11, 0
  STORE r0, r11
  ; Render "SCORE: NNNNNN"
  LDI r10, 2
  LDI r2, 2
  LDI r12, 0x5000
  TEXT r10, r2, r12
  ; Lives text
  LDI r0, 0x5010
  LDI r11, 76
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 73
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 86
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 69
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 83
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 58
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 32
  STORE r0, r11
  ADDI r0, 1
  LDI r6, 0x2005
  LOAD r11, r6
  ADDI r11, 48
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 0
  STORE r0, r11
  LDI r10, 200
  LDI r2, 2
  LDI r12, 0x5010
  TEXT r10, r2, r12
  ; Wave text
  LDI r0, 0x5020
  LDI r11, 87
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 65
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 86
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 69
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 58
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 32
  STORE r0, r11
  ADDI r0, 1
  LDI r6, 0x2007
  LOAD r11, r6
  ADDI r11, 48
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 0
  STORE r0, r11
  LDI r10, 2
  LDI r2, 14
  LDI r12, 0x5020
  TEXT r10, r2, r12
  RET

; ── GAME OVER ───────────────────────────────────────────
game_over:
  LDI r4, 0
  FILL r4
  ; "GAME OVER" text
  LDI r0, 0x5000
  LDI r11, 71
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 65
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 77
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 69
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 32
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 79
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 86
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 69
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 82
  STORE r0, r11
  ADDI r0, 1
  LDI r11, 0
  STORE r0, r11
  LDI r10, 68
  LDI r2, 110
  LDI r12, 0x5000
  TEXT r10, r2, r12
  FRAME
  IKEY r9
  CMPI r9, 82
  JZ r14, restart
  CMPI r9, 114
  JZ r14, restart
  JMP game_over
