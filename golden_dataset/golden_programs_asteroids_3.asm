; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
  BLT r14, sq01
  CMPI r2, 192
  BLT r14, sq23
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
  BLT r14, sin_lp
  RET

; ── INIT GAME ───────────────────────────────────────────
; Ship fields: 0x2000=x 0x2001=y 0x2002=ang 0x2003=vx 0x2004=vy
;              0x2005=lives 0x2006=score 0x2007=wave 0x2008=dead
;              0x2009=cooldown 0x200A=invuln 0x200B=bul_idx 0x200C=ast_cnt
init_game:
  LDI r4, 0x2000
  LDI r10, 128
  STORE r4, r10
  ADDI r4, 1
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 0
  STORE r4, r10
  ADDI r4, 1
  STORE r4, r10
  ADDI r4, 1
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 3
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 0
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 1
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 0
  STORE r4, r10
  ADDI r4, 1
  STORE r4, r10
  ADDI r4, 1
  STORE r4, r10
  ADDI r4, 1
  STORE r4, r10
  ADDI r4, 1
  STORE r4, r10
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
  LDI r4, 0x2007
  LOAD r10, r4
  ADDI r10, 1
  LDI r15, 8
  CMP r10, r15
  BLT r14, sw_ok
  LDI r10, 8
sw_ok:
  MOV r21, r10
  LDI r4, 0x200C
  STORE r4, r10
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
  RAND r10
  ANDI r10, 0xFF
  CMPI r10, 32
  BLT r14, sx_ok
  CMPI r10, 224
  BLT r14, sx_ok2
  LDI r10, 32
  JMP sx_done
sx_ok2:
  LDI r10, 224
  JMP sx_done
sx_ok:
  RAND r0
  ANDI r0, 0xFF
  CMPI r0, 32
  BLT r14, sy_ok
  CMPI r0, 224
  BLT r14, sy_ok2
  LDI r0, 32
  JMP sy_done
sy_ok2:
  LDI r0, 224
  JMP sy_done
sy_ok:
sy_done:
sx_done:
  ; Random velocity (-2 to +1)
  RAND r1
  ANDI r1, 3
  LDI r15, 1
  SUB r1, r15
  RAND r7
  ANDI r7, 3
  SUB r7, r15
  ; Store asteroid
  STORE r23, r10
  LDI r23, 0x4000
  ADD r23, r22
  ADDI r23, 1
  STORE r23, r0
  ADDI r23, 1
  STORE r23, r1
  ADDI r23, 1
  STORE r23, r7
  ADDI r23, 1
  LDI r10, 0
  STORE r23, r10
  ; Increment ast_count
  LDI r4, 0x200C
  LOAD r10, r4
  ADDI r10, 1
  STORE r4, r10
  SUBI r21, 1
  JMP sw_lp
sw_done:
  RET

; ── MAIN GAME LOOP ─────────────────────────────────────
game_loop:
  LDI r4, 0x2008
  LOAD r10, r4
  JNZ r10, game_over
  ; Read input
  IKEY r6
  CMPI r6, 65
  JZ r14, rot_l
  CMPI r6, 97
  JZ r14, rot_l
  CMPI r6, 68
  JZ r14, rot_r
  CMPI r6, 100
  JZ r14, rot_r
  CMPI r6, 87
  JZ r14, do_thrust
  CMPI r6, 119
  JZ r14, do_thrust
  CMPI r6, 32
  JZ r14, do_shoot
  JMP no_input
rot_l:
  LDI r4, 0x2002
  LOAD r10, r4
  ADDI r10, 240
  ANDI r10, 0xFF
  STORE r4, r10
  JMP no_input
rot_r:
  LDI r4, 0x2002
  LOAD r10, r4
  ADDI r10, 16
  ANDI r10, 0xFF
  STORE r4, r10
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
  SAR r18, r10
  LDI r10, 3
  SAR r18, r10
  SAR r17, r10
  ; Add to velocity
  LDI r4, 0x2003
  LOAD r10, r4
  ADD r10, r18
  STORE r4, r10
  LDI r4, 0x2004
  LOAD r10, r4
  ADD r10, r17
  STORE r4, r10
  JMP no_input
do_shoot:
  ; Check cooldown
  LDI r4, 0x2009
  LOAD r10, r4
  JNZ r10, no_input
  LDI r10, 15
  STORE r4, r10
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
  LDI r10, 4
  SAR r18, r10
  SHLI r17, 1
  ADD r17, r17
  SAR r17, r10
  ; Bullet start position = ship pos + direction * 12
  LDI r4, 0x2000
  LOAD r27, r4
  SHLI r18, 1
  ADD r18, r18
  LDI r10, 5
  SAR r18, r10
  ADD r27, r18
  LDI r4, 0x2001
  LOAD r28, r4
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
  LDI r4, 0x200B
  LOAD r10, r4
  ADDI r10, 1
  ANDI r10, 3
  STORE r4, r10
no_input:
  ; Decrement cooldown
  LDI r4, 0x2009
  LOAD r10, r4
  JZ r10, cd_ok
  SUBI r10, 1
  STORE r4, r10
cd_ok:
  ; Decrement invulnerability
  LDI r4, 0x200A
  LOAD r10, r4
  JZ r10, inv_ok
  SUBI r10, 1
  STORE r4, r10
inv_ok:
  ; Update ship position
  LDI r4, 0x2000
  LOAD r10, r4
  LDI r15, 0x2003
  LOAD r0, r15
  ADD r10, r0
  STORE r4, r10
  LDI r4, 0x2001
  LOAD r10, r4
  LDI r15, 0x2004
  LOAD r0, r15
  ADD r10, r0
  STORE r4, r10
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
  LOAD r10, r4
  JNZ r10, draw_start
  LDI r4, 0x2007
  LOAD r10, r4
  ADDI r10, 1
  STORE r4, r10
  PUSH r31
  CALL spawn_wave
  POP r31
draw_start:
  ; Clear screen
  LDI r12, 0
  FILL r12
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
  LOAD r10, r4
  CMPI r10, 256
  BLT r14, ws_y
  SUBI r10, 256
  STORE r4, r10
ws_y:
  LDI r4, 0x2001
  LOAD r10, r4
  CMPI r10, 256
  BLT r14, ws_done
  SUBI r10, 256
  STORE r4, r10
ws_done:
  RET

; ── UPDATE BULLETS ──────────────────────────────────────
update_bullets:
  LDI r20, 0x4200
  LDI r21, 4
ub_lp:
  JZ r21, ub_done
  ; Load bullet: x(r10), y(r0), vx(r1), vy(r4)
  LOAD r10, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r0, r22
  ADDI r22, 1
  LOAD r1, r22
  ADDI r22, 1
  LOAD r4, r22
  ; Check if off screen (x>=256 or y>=256)
  CMPI r10, 256
  BLT r14, ub_ychk
  ; Off screen - mark inactive (set x=0xFFFF)
  LDI r15, 0xFFFF
  STORE r20, r15
  JMP ub_next
ub_ychk:
  CMPI r0, 256
  BLT r14, ub_move
  LDI r15, 0xFFFF
  STORE r20, r15
  JMP ub_next
ub_move:
  ; Update position
  ADD r10, r1
  STORE r20, r10
  MOV r22, r20
  ADDI r22, 1
  ADD r0, r4
  STORE r22, r0
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
  ; Load x(r10), y(r0), vx(r1), vy(r4)
  LOAD r10, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r0, r22
  ADDI r22, 1
  LOAD r1, r22
  ADDI r22, 1
  LOAD r4, r22
  ; Move
  ADD r10, r1
  STORE r20, r10
  MOV r22, r20
  ADDI r22, 1
  ADD r0, r4
  STORE r22, r0
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
  LOAD r10, r20
  CMPI r10, 256
  BLT r14, wa_ay
  SUBI r10, 256
  STORE r20, r10
wa_ay:
  MOV r22, r20
  ADDI r22, 1
  LOAD r10, r22
  CMPI r10, 256
  BLT r14, wa_nx
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
  LOAD r2, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r5, r22
  ; Check if bullet is active (x < 256)
  CMPI r2, 256
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
  LOAD r10, r23
  MOV r25, r23
  ADDI r25, 1
  LOAD r0, r25
  ; Distance squared
  MOV r6, r2
  SUB r6, r10
  MUL r6, r6
  MOV r3, r5
  SUB r3, r0
  MUL r3, r3
  ADD r6, r3
  ; Collision radius depends on size
  CMPI r26, 2
  JZ r14, cb_sz0
  CMPI r26, 1
  JZ r14, cb_sz1
  LDI r15, 900
  CMP r6, r15
  BLT r14, cb_hit
  JMP cb_anext
cb_sz0:
  LDI r15, 625
  CMP r6, r15
  BLT r14, cb_hit
  JMP cb_anext
cb_sz1:
  LDI r15, 400
  CMP r6, r15
  BLT r14, cb_hit
  JMP cb_anext
cb_hit:
  ; Destroy asteroid (set size=255)
  MOV r25, r23
  ADDI r25, 4
  LDI r15, 255
  STORE r25, r15
  ; Deactivate bullet (set x=0xFFFF)
  LDI r15, 0xFFFF
  STORE r20, r15
  ; Add score
  CMPI r26, 2
  JZ r14, cb_sc0
  CMPI r26, 1
  JZ r14, cb_sc1
  LDI r15, 100
  JMP cb_addsc
cb_sc0:
  LDI r15, 25
  JMP cb_addsc
cb_sc1:
  LDI r15, 50
cb_addsc:
  LDI r4, 0x2006
  LOAD r10, r4
  ADD r10, r15
  STORE r4, r10
  ; Decrement ast_count
  LDI r4, 0x200C
  LOAD r10, r4
  SUBI r10, 1
  STORE r4, r10
  ; Split if not small (size != 2)
  CMPI r26, 2
  JZ r14, cb_nosplit
  ; Determine child size
  CMPI r26, 0
  JZ r14, cb_sp_lg
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
  LDI r11, 440
  LDI r13, 80
  BEEP r11, r13
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
  LOAD r10, r4
  JNZ r10, cb_done
  ; Load ship x, y
  LDI r4, 0x2000
  LOAD r2, r4
  LDI r4, 0x2001
  LOAD r5, r4
  LDI r23, 0x4000
  LDI r24, 8
cs_lp:
  JZ r24, cb_done
  MOV r25, r23
  ADDI r25, 4
  LOAD r26, r25
  CMPI r26, 255
  JZ r14, cs_next
  LOAD r10, r23
  MOV r25, r23
  ADDI r25, 1
  LOAD r0, r25
  MOV r6, r2
  SUB r6, r10
  MUL r6, r6
  MOV r3, r5
  SUB r3, r0
  MUL r3, r3
  ADD r6, r3
  LDI r15, 484
  CMP r6, r15
  BLT r14, cs_die
  JMP cs_next
cs_die:
  ; Lose a life
  LDI r4, 0x2005
  LOAD r10, r4
  SUBI r10, 1
  STORE r4, r10
  ; Sound
  LDI r11, 220
  LDI r13, 200
  BEEP r11, r13
  ; Check game over
  JNZ r10, cs_over
  ; Respawn at center
  LDI r4, 0x2000
  LDI r10, 128
  STORE r4, r10
  ADDI r4, 1
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 0
  STORE r4, r10
  ADDI r4, 1
  STORE r4, r10
  ADDI r4, 1
  STORE r4, r10
  ; Invulnerability
  LDI r4, 0x200A
  LDI r10, 120
  STORE r4, r10
  JMP cb_done
cs_over:
  LDI r4, 0x2008
  LDI r10, 1
  STORE r4, r10
  JMP cb_done
cs_next:
  ADDI r23, 5
  SUBI r24, 1
  JMP cs_lp
cb_done:
  RET

; ── SPAWN CHILDREN (after asteroid destruction) ──────────
; r10 = asteroid x (from LOAD r10, r23), r0 = asteroid y
; Actually we need to reload - the registers may be clobbered
; Stack: child_size in r10
spawn_children:
  ; Reload parent position from the asteroid slot we just hit
  ; r23 still points to the asteroid base
  LOAD r15, r23
  MOV r22, r23
  ADDI r22, 1
  LOAD r7, r22
  ; Random velocities for child 1
  RAND r0
  ANDI r0, 3
  LDI r1, 1
  SUB r0, r1
  RAND r6
  ANDI r6, 3
  SUB r6, r1
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
  STORE r20, r15
  ADDI r20, 1
  STORE r20, r7
  ADDI r20, 1
  STORE r20, r0
  ADDI r20, 1
  STORE r20, r6
  ADDI r20, 1
  STORE r20, r10
  LDI r4, 0x200C
  LOAD r3, r4
  ADDI r3, 1
  STORE r4, r3
  ; Child 2: opposite velocities
  NEG r0
  NEG r6
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
  STORE r20, r15
  ADDI r20, 1
  STORE r20, r7
  ADDI r20, 1
  STORE r20, r0
  ADDI r20, 1
  STORE r20, r6
  ADDI r20, 1
  STORE r20, r10
  LDI r4, 0x200C
  LOAD r3, r4
  ADDI r3, 1
  STORE r4, r3
sp_done:
  RET

; ── DRAW SHIP ───────────────────────────────────────────
draw_ship:
  ; Check invulnerability blink
  LDI r4, 0x200A
  LOAD r10, r4
  JZ r10, ds_draw
  ANDI r10, 8
  JNZ r10, ds_skip
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
  LOAD r11, r4
  LDI r4, 0x2001
  LOAD r13, r4
  ; Nose: pos + dir * 15
  LDI r19, 15
  MOV r21, r19
  MUL r21, r18
  LDI r22, 7
  SAR r21, r22
  ADD r21, r11
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
  ADD r28, r11
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
  MOV r10, r19
  MUL r10, r27
  SAR r10, r22
  ADD r10, r11
  MOV r0, r19
  MUL r0, r25
  SAR r0, r22
  ADD r0, r13
  ; Draw triangle
  LDI r1, 0x00FF00
  LINE r21, r23, r28, r29, r1
  LINE r28, r29, r10, r0, r1
  LINE r10, r0, r21, r23, r1
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
  LOAD r10, r20
  MOV r22, r20
  ADDI r22, 1
  LOAD r0, r22
  ADDI r22, 4
  LOAD r23, r22
  ; Draw circle based on size
  CMPI r23, 0
  JZ r14, da_large
  CMPI r23, 1
  JZ r14, da_med
  ; small
  LDI r4, 5
  LDI r15, 0x888888
  CIRCLE r10, r0, r4, r15
  JMP da_next
da_large:
  LDI r4, 18
  LDI r15, 0xAAAAAA
  CIRCLE r10, r0, r4, r15
  JMP da_next
da_med:
  LDI r4, 10
  LDI r15, 0xCCCCCC
  CIRCLE r10, r0, r4, r15
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
  LOAD r0, r22
  ; Only draw if on screen
  CMPI r10, 256
  BLT r14, db_ychk
  JMP db_next
db_ychk:
  CMPI r0, 256
  BLT r14, db_draw
  JMP db_next
db_draw:
  LDI r1, 0xFFFFFF
  PSET r10, r0, r1
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
  LDI r10, 83
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 67
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 79
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 82
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 69
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 58
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 32
  STORE r4, r10
  ADDI r4, 1
  ; Score number (6 digits)
  LDI r15, 0x2006
  LOAD r12, r15
  LDI r7, 100000
  DIV r10, r7
  ADDI r10, 48
  STORE r4, r10
  MOD r12, r7
  ADDI r4, 1
  LDI r7, 10000
  DIV r10, r7
  ADDI r10, 48
  STORE r4, r10
  MOD r12, r7
  ADDI r4, 1
  LDI r7, 1000
  DIV r10, r7
  ADDI r10, 48
  STORE r4, r10
  MOD r12, r7
  ADDI r4, 1
  LDI r7, 100
  DIV r10, r7
  ADDI r10, 48
  STORE r4, r10
  MOD r12, r7
  ADDI r4, 1
  LDI r7, 10
  DIV r10, r7
  ADDI r10, 48
  STORE r4, r10
  MOD r12, r7
  ADDI r12, 48
  ADDI r4, 1
  STORE r4, r12
  ADDI r4, 1
  LDI r10, 0
  STORE r4, r10
  ; Render "SCORE: NNNNNN"
  LDI r2, 2
  LDI r5, 2
  LDI r8, 0x5000
  TEXT r2, r5, r8
  ; Lives text
  LDI r4, 0x5010
  LDI r10, 76
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 73
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 86
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 69
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 83
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 58
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 32
  STORE r4, r10
  ADDI r4, 1
  LDI r15, 0x2005
  LOAD r10, r15
  ADDI r10, 48
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 0
  STORE r4, r10
  LDI r2, 200
  LDI r5, 2
  LDI r8, 0x5010
  TEXT r2, r5, r8
  ; Wave text
  LDI r4, 0x5020
  LDI r10, 87
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 65
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 86
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 69
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 58
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 32
  STORE r4, r10
  ADDI r4, 1
  LDI r15, 0x2007
  LOAD r10, r15
  ADDI r10, 48
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 0
  STORE r4, r10
  LDI r2, 2
  LDI r5, 14
  LDI r8, 0x5020
  TEXT r2, r5, r8
  RET

; ── GAME OVER ───────────────────────────────────────────
game_over:
  LDI r12, 0
  FILL r12
  ; "GAME OVER" text
  LDI r4, 0x5000
  LDI r10, 71
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 65
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 77
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 69
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 32
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 79
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 86
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 69
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 82
  STORE r4, r10
  ADDI r4, 1
  LDI r10, 0
  STORE r4, r10
  LDI r2, 68
  LDI r5, 110
  LDI r8, 0x5000
  TEXT r2, r5, r8
  FRAME
  IKEY r6
  CMPI r6, 82
  JZ r14, restart
  CMPI r6, 114
  JZ r14, restart
  JMP game_over
