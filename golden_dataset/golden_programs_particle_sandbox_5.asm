; DESCRIPTION: Render a colored rectangle at the screen.

; particle_sandbox.asm -- Particle Physics Sandbox
;
; Real-time particle simulation with gravity, wall bouncing,
; interactive spawning, and velocity-based coloring.
;
; Controls:
;   Space (32)  = spawn 8 particles at random positions
;   W (87/119)  = gravity up      S (83/115) = gravity down
;   A (65/97)   = gravity left    D (68/100) = gravity right
;   R (82/114)  = reset all       G (71/103) = zero gravity
;
; Memory Layout:
;   0x7000..0x73FF = particle table (128 * 4 words: x, y, vx, vy)
;   0x7600..0x760F = speed color table (16 entries)
;   0x7800 = gravity_x (signed)
;   0x7801 = gravity_y (signed)
;   0x7802 = particle_count (0..128)
;   0x7803 = frame_counter

; ===== Constants =====
LDI r1, 1
LDI r21, 4               ; words per particle
LDI r22, 128             ; max particles
LDI r23, 0x7000          ; particle table base
LDI r24, 0x7800          ; gravity_x addr
LDI r25, 0x7801          ; gravity_y addr
LDI r26, 0x7802          ; particle_count addr
LDI r27, 0x7803          ; frame_counter addr
LDI r30, 0xFF00          ; initialize stack pointer

; ===== Build Speed-to-Color Table (16 entries at 0x7600) =====
; Speed 0=blue(slow) .. 7=green .. 11=yellow .. 15=red(fast)
LDI r13, 0x7600
LDI r5, 0x0000FF         ; 0 - blue
STORE r13, r5
ADD r13, r1
LDI r5, 0x0022FF         ; 1 - blue-cyan
STORE r13, r5
ADD r13, r1
LDI r5, 0x0066FF         ; 2 - cyan
STORE r13, r5
ADD r13, r1
LDI r5, 0x00AAFF         ; 3 - cyan-green
STORE r13, r5
ADD r13, r1
LDI r5, 0x00FFAA         ; 4 - green-cyan
STORE r13, r5
ADD r13, r1
LDI r5, 0x00FF66         ; 5 - green
STORE r13, r5
ADD r13, r1
LDI r5, 0x00FF22         ; 6 - green-yellow
STORE r13, r5
ADD r13, r1
LDI r5, 0x44FF00         ; 7 - yellow-green
STORE r13, r5
ADD r13, r1
LDI r5, 0x88FF00         ; 8 - yellow
STORE r13, r5
ADD r13, r1
LDI r5, 0xCCFF00         ; 9 - yellow
STORE r13, r5
ADD r13, r1
LDI r5, 0xFFFF00         ; 10 - yellow-orange
STORE r13, r5
ADD r13, r1
LDI r5, 0xFFAA00         ; 11 - orange
STORE r13, r5
ADD r13, r1
LDI r5, 0xFF6600         ; 12 - orange
STORE r13, r5
ADD r13, r1
LDI r5, 0xFF2200         ; 13 - red-orange
STORE r13, r5
ADD r13, r1
LDI r5, 0xFF0000         ; 14 - red
STORE r13, r5
ADD r13, r1
LDI r5, 0xFF0044         ; 15 - red-pink
STORE r13, r5

; ===== Initialize State =====
LDI r18, 0
STORE r24, r18            ; gravity_x = 0
LDI r18, 1
STORE r25, r18            ; gravity_y = 1 (down)
STORE r26, r18            ; particle_count = 0
STORE r27, r18            ; frame_counter = 0

; ===== Initial Burst =====
LDI r14, 128
LDI r2, 128
CALL spawn_burst

; Set gravity down
LDI r18, 0
STORE r24, r18
LDI r18, 1
STORE r25, r18

; ===== Main Loop =====
main_loop:
  ; Increment frame counter
  LOAD r18, r27
  ADD r18, r1
  STORE r27, r18

  ; Read keyboard
  IKEY r19

  ; Space = spawn at center
  LDI r18, 32
  CMP r19, r18
  JZ r7, do_spawn

  ; W = gravity up
  LDI r18, 87
  CMP r19, r18
  JZ r7, grav_up
  LDI r18, 119
  CMP r19, r18
  JZ r7, grav_up

  ; S = gravity down
  LDI r18, 83
  CMP r19, r18
  JZ r7, grav_down
  LDI r18, 115
  CMP r19, r18
  JZ r7, grav_down

  ; A = gravity left
  LDI r18, 65
  CMP r19, r18
  JZ r7, grav_left
  LDI r18, 97
  CMP r19, r18
  JZ r7, grav_left

  ; D = gravity right
  LDI r18, 68
  CMP r19, r18
  JZ r7, grav_right
  LDI r18, 100
  CMP r19, r18
  JZ r7, grav_right

  ; R = reset
  LDI r18, 82
  CMP r19, r18
  JZ r7, do_reset
  LDI r18, 114
  CMP r19, r18
  JZ r7, do_reset

  ; G = zero gravity
  LDI r18, 71
  CMP r19, r18
  JZ r7, grav_zero
  LDI r18, 103
  CMP r19, r18
  JZ r7, grav_zero

  JMP after_input

do_spawn:
  LDI r14, 128
  LDI r2, 128
  CALL spawn_burst
  JMP after_input

grav_up:
  LDI r18, 0
  STORE r24, r18
  LDI r18, 0xFFFFFFFF
  STORE r25, r18
  JMP after_input

grav_down:
  LDI r18, 0
  STORE r24, r18
  LDI r18, 1
  STORE r25, r18
  JMP after_input

grav_left:
  LDI r18, 0xFFFFFFFF
  STORE r24, r18
  LDI r18, 0
  STORE r25, r18
  JMP after_input

grav_right:
  LDI r18, 1
  STORE r24, r18
  LDI r18, 0
  STORE r25, r18
  JMP after_input

grav_zero:
  LDI r18, 0
  STORE r24, r18
  STORE r25, r18
  JMP after_input

do_reset:
  LDI r18, 0
  STORE r26, r18
  JMP after_input

after_input:
  ; Scroll for trail effect
  LDI r18, 1
  SCROLL r18

  ; ===== Update and Render =====
  LOAD r10, r26           ; particle_count
  JZ r10, draw_hud

  LDI r4, 0              ; index = 0

update_loop:
  ; Address = base + index * 4
  MOV r13, r23
  MOV r5, r4
  LDI r18, 4
  MUL r5, r18
  ADD r13, r5

  ; Load particle
  LOAD r12, r13            ; x
  ADD r13, r1
  LOAD r8, r13            ; y
  ADD r13, r1
  LOAD r9, r13            ; vx
  ADD r13, r1
  LOAD r11, r13            ; vy

  ; Apply gravity
  PUSH r7
  LOAD r18, r24
  ADD r9, r18             ; vx += gx
  LOAD r18, r25
  ADD r11, r18             ; vy += gy
  POP r7

  ; Update position
  ADD r12, r9              ; x += vx
  ADD r8, r11              ; y += vy

  ; Bounce off walls with damping
  CALL bounce_particle

  ; Store updated state
  MOV r13, r23
  MOV r5, r4
  LDI r18, 4
  MUL r5, r18
  ADD r13, r5

  STORE r13, r12           ; x
  ADD r13, r1
  STORE r13, r8           ; y
  ADD r13, r1
  STORE r13, r9           ; vx
  ADD r13, r1
  STORE r13, r11           ; vy

  ; Color by speed
  CALL compute_color

  ; Draw 2x2 particle
  PSET r12, r8, r0
  MOV r18, r12
  ADD r18, r1
  PSET r18, r8, r0
  MOV r18, r8
  ADD r18, r1
  PSET r12, r18, r0
  MOV r18, r12
  ADD r18, r1
  PSET r18, r18, r0

  ; Next particle
  ADD r4, r1
  CMP r4, r10
  BLT r7, update_loop

draw_hud:
  ; Draw gravity arrow indicator at top-right
  LOAD r18, r24           ; gx
  LOAD r19, r25           ; gy
  LDI r20, 245            ; arrow center x
  LDI r12, 12              ; arrow center y
  LDI r21, 0xFFFF00       ; yellow

  PUSH r7
  LDI r22, 0

  ; Check if gravity_y nonzero
  CMP r19, r22
  JZ r7, hud_check_gx
  BGE r7, hud_arrow_down

  ; Up arrow
  LDI r12, 8
  PSET r20, r12, r21
  ADD r12, r1
  PSET r20, r12, r21
  ADD r12, r1
  PSET r20, r12, r21
  ADD r12, r1
  PSET r20, r12, r21
  ADD r12, r1
  PSET r20, r12, r21
  LDI r12, 8
  LDI r8, 244
  PSET r8, r12, r21
  LDI r8, 246
  PSET r8, r12, r21
  JMP hud_done

hud_arrow_down:
  LDI r12, 12
  PSET r20, r12, r21
  ADD r12, r1
  PSET r20, r12, r21
  ADD r12, r1
  PSET r20, r12, r21
  ADD r12, r1
  PSET r20, r12, r21
  ADD r12, r1
  PSET r20, r12, r21
  LDI r12, 16
  LDI r8, 244
  PSET r8, r12, r21
  LDI r8, 246
  PSET r8, r12, r21
  JMP hud_done

hud_check_gx:
  CMP r18, r22
  JZ r7, hud_dot

  ; Left arrow
  LDI r12, 241
  PSET r12, r20, r21
  ADD r12, r1
  PSET r12, r20, r21
  ADD r12, r1
  PSET r12, r20, r21
  ADD r12, r1
  PSET r12, r20, r21
  ADD r12, r1
  PSET r12, r20, r21
  LDI r12, 241
  LDI r8, 11
  PSET r12, r8, r21
  LDI r8, 13
  PSET r12, r8, r21
  JMP hud_done

hud_dot:
  PSET r20, r20, r21

hud_done:
  POP r7

  FRAME
  JMP main_loop

; ===== Subroutine: bounce_particle =====
; Bounces particle (r12=x, r8=y, r9=vx, r11=vy) off screen edges
; Modifies r12, r8, r9, r11 in place
bounce_particle:
  PUSH r31
  PUSH r7

  ; Right wall (x > 254)
  LDI r18, 254
  CMP r12, r18
  BLT r7, bp_x_low
  LDI r12, 254
  CALL damp_neg          ; negate and damp r9
bp_x_low:
  ; Left wall (x as signed < 0)
  MOV r18, r12
  LDI r19, 0
  CMP r18, r19
  BGE r7, bp_y_high
  LDI r12, 0
  CALL damp_neg

bp_y_high:
  ; Bottom wall (y > 254)
  LDI r18, 254
  CMP r8, r18
  BLT r7, bp_y_low
  LDI r8, 254
  CALL damp_neg_vy

bp_y_low:
  MOV r18, r8
  LDI r19, 0
  CMP r18, r19
  BGE r7, bp_done
  LDI r8, 0
  CALL damp_neg_vy

bp_done:
  POP r7
  POP r31
  RET

; ===== Subroutine: damp_neg =====
; Negate r9 and apply damping (lose 1 from absolute value)
damp_neg:
  PUSH r7
  NEG r9
  ; Dampen: reduce |r9| by 1
  LDI r18, 0
  CMP r9, r18
  BGE r7, dn_pos
  ; r9 is negative: negate, sub 1, if 0 set to 0, else negate back
  NEG r9
  SUB r9, r1
  JZ r9, dn_zero
  NEG r9
  JMP dn_done
dn_pos:
  SUB r9, r1
  JZ r9, dn_zero
  JMP dn_done
dn_zero:
  LDI r9, 0
dn_done:
  POP r7
  RET

; ===== Subroutine: damp_neg_vy =====
; Negate r11 and apply damping
damp_neg_vy:
  PUSH r7
  NEG r11
  LDI r18, 0
  CMP r11, r18
  BGE r7, dv_pos
  NEG r11
  SUB r11, r1
  JZ r11, dv_zero
  NEG r11
  JMP dv_done
dv_pos:
  SUB r11, r1
  JZ r11, dv_zero
  JMP dv_done
dv_zero:
  LDI r11, 0
dv_done:
  POP r7
  RET

; ===== Subroutine: compute_color =====
; Sets r0 = color based on particle velocity (r9=vx, r11=vy)
compute_color:
  PUSH r7
  ; speed = |vx| + |vy|, clamped to 0..15
  MOV r18, r9
  LDI r19, 0
  CMP r18, r19
  BGE r7, cc_vx_pos
  NEG r18
cc_vx_pos:
  MOV r6, r18

  MOV r18, r11
  LDI r19, 0
  CMP r18, r19
  BGE r7, cc_vy_pos
  NEG r18
cc_vy_pos:
  ADD r6, r18

  ; Clamp to 15
  LDI r18, 15
  CMP r6, r18
  BLT r7, cc_lookup
  MOV r6, r18

cc_lookup:
  LDI r18, 0x7600
  ADD r18, r6
  LOAD r0, r18

  POP r7
  RET

; ===== Subroutine: spawn_burst =====
; Spawns 8 particles at (r14, r2) with random velocities
spawn_burst:
  PUSH r31
  PUSH r7

  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r7, sb_done

  ; Address = base + count * 4
  MOV r13, r23
  MOV r5, r18
  LDI r17, 4
  MUL r5, r17
  ADD r13, r5

  ; x = center + random(-8..7)
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r14
  ADD r18, r17
  STORE r13, r18

  ; y = center + random(-8..7)
  ADD r13, r1
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r2
  ADD r18, r17
  STORE r13, r18

  ; vx = random(-3..4)
  ADD r13, r1
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r13, r17

  ; vy = random(-5..2)
  ADD r13, r1
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r13, r17

  ; Increment count
  LOAD r18, r26
  ADD r18, r1
  STORE r26, r18

  SUB r16, r1
  JNZ r16, sb_loop

sb_done:
  POP r7
  POP r31
  RET
