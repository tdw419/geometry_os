; DESCRIPTION: Draws a colored rectangle at the screen with fixed size.

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
LDI r0, 1
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
LDI r14, 0x7600
LDI r12, 0x0000FF         ; 0 - blue
STORE r14, r12
ADD r14, r0
LDI r12, 0x0022FF         ; 1 - blue-cyan
STORE r14, r12
ADD r14, r0
LDI r12, 0x0066FF         ; 2 - cyan
STORE r14, r12
ADD r14, r0
LDI r12, 0x00AAFF         ; 3 - cyan-green
STORE r14, r12
ADD r14, r0
LDI r12, 0x00FFAA         ; 4 - green-cyan
STORE r14, r12
ADD r14, r0
LDI r12, 0x00FF66         ; 5 - green
STORE r14, r12
ADD r14, r0
LDI r12, 0x00FF22         ; 6 - green-yellow
STORE r14, r12
ADD r14, r0
LDI r12, 0x44FF00         ; 7 - yellow-green
STORE r14, r12
ADD r14, r0
LDI r12, 0x88FF00         ; 8 - yellow
STORE r14, r12
ADD r14, r0
LDI r12, 0xCCFF00         ; 9 - yellow
STORE r14, r12
ADD r14, r0
LDI r12, 0xFFFF00         ; 10 - yellow-orange
STORE r14, r12
ADD r14, r0
LDI r12, 0xFFAA00         ; 11 - orange
STORE r14, r12
ADD r14, r0
LDI r12, 0xFF6600         ; 12 - orange
STORE r14, r12
ADD r14, r0
LDI r12, 0xFF2200         ; 13 - red-orange
STORE r14, r12
ADD r14, r0
LDI r12, 0xFF0000         ; 14 - red
STORE r14, r12
ADD r14, r0
LDI r12, 0xFF0044         ; 15 - red-pink
STORE r14, r12

; ===== Initialize State =====
LDI r18, 0
STORE r24, r18            ; gravity_x = 0
LDI r18, 1
STORE r25, r18            ; gravity_y = 1 (down)
STORE r26, r18            ; particle_count = 0
STORE r27, r18            ; frame_counter = 0

; ===== Initial Burst =====
LDI r3, 128
LDI r8, 128
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
  ADD r18, r0
  STORE r27, r18

  ; Read keyboard
  IKEY r19

  ; Space = spawn at center
  LDI r18, 32
  CMP r19, r18
  JZ r13, do_spawn

  ; W = gravity up
  LDI r18, 87
  CMP r19, r18
  JZ r13, grav_up
  LDI r18, 119
  CMP r19, r18
  JZ r13, grav_up

  ; S = gravity down
  LDI r18, 83
  CMP r19, r18
  JZ r13, grav_down
  LDI r18, 115
  CMP r19, r18
  JZ r13, grav_down

  ; A = gravity left
  LDI r18, 65
  CMP r19, r18
  JZ r13, grav_left
  LDI r18, 97
  CMP r19, r18
  JZ r13, grav_left

  ; D = gravity right
  LDI r18, 68
  CMP r19, r18
  JZ r13, grav_right
  LDI r18, 100
  CMP r19, r18
  JZ r13, grav_right

  ; R = reset
  LDI r18, 82
  CMP r19, r18
  JZ r13, do_reset
  LDI r18, 114
  CMP r19, r18
  JZ r13, do_reset

  ; G = zero gravity
  LDI r18, 71
  CMP r19, r18
  JZ r13, grav_zero
  LDI r18, 103
  CMP r19, r18
  JZ r13, grav_zero

  JMP after_input

do_spawn:
  LDI r3, 128
  LDI r8, 128
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
  LOAD r2, r26           ; particle_count
  JZ r2, draw_hud

  LDI r1, 0              ; index = 0

update_loop:
  ; Address = base + index * 4
  MOV r14, r23
  MOV r12, r1
  LDI r18, 4
  MUL r12, r18
  ADD r14, r12

  ; Load particle
  LOAD r10, r14            ; x
  ADD r14, r0
  LOAD r7, r14            ; y
  ADD r14, r0
  LOAD r15, r14            ; vx
  ADD r14, r0
  LOAD r5, r14            ; vy

  ; Apply gravity
  PUSH r13
  LOAD r18, r24
  ADD r15, r18             ; vx += gx
  LOAD r18, r25
  ADD r5, r18             ; vy += gy
  POP r13

  ; Update position
  ADD r10, r15              ; x += vx
  ADD r7, r5              ; y += vy

  ; Bounce off walls with damping
  CALL bounce_particle

  ; Store updated state
  MOV r14, r23
  MOV r12, r1
  LDI r18, 4
  MUL r12, r18
  ADD r14, r12

  STORE r14, r10           ; x
  ADD r14, r0
  STORE r14, r7           ; y
  ADD r14, r0
  STORE r14, r15           ; vx
  ADD r14, r0
  STORE r14, r5           ; vy

  ; Color by speed
  CALL compute_color

  ; Draw 2x2 particle
  PSET r10, r7, r11
  MOV r18, r10
  ADD r18, r0
  PSET r18, r7, r11
  MOV r18, r7
  ADD r18, r0
  PSET r10, r18, r11
  MOV r18, r10
  ADD r18, r0
  PSET r18, r18, r11

  ; Next particle
  ADD r1, r0
  CMP r1, r2
  BLT r13, update_loop

draw_hud:
  ; Draw gravity arrow indicator at top-right
  LOAD r18, r24           ; gx
  LOAD r19, r25           ; gy
  LDI r20, 245            ; arrow center x
  LDI r10, 12              ; arrow center y
  LDI r21, 0xFFFF00       ; yellow

  PUSH r13
  LDI r22, 0

  ; Check if gravity_y nonzero
  CMP r19, r22
  JZ r13, hud_check_gx
  BGE r13, hud_arrow_down

  ; Up arrow
  LDI r10, 8
  PSET r20, r10, r21
  ADD r10, r0
  PSET r20, r10, r21
  ADD r10, r0
  PSET r20, r10, r21
  ADD r10, r0
  PSET r20, r10, r21
  ADD r10, r0
  PSET r20, r10, r21
  LDI r10, 8
  LDI r7, 244
  PSET r7, r10, r21
  LDI r7, 246
  PSET r7, r10, r21
  JMP hud_done

hud_arrow_down:
  LDI r10, 12
  PSET r20, r10, r21
  ADD r10, r0
  PSET r20, r10, r21
  ADD r10, r0
  PSET r20, r10, r21
  ADD r10, r0
  PSET r20, r10, r21
  ADD r10, r0
  PSET r20, r10, r21
  LDI r10, 16
  LDI r7, 244
  PSET r7, r10, r21
  LDI r7, 246
  PSET r7, r10, r21
  JMP hud_done

hud_check_gx:
  CMP r18, r22
  JZ r13, hud_dot

  ; Left arrow
  LDI r10, 241
  PSET r10, r20, r21
  ADD r10, r0
  PSET r10, r20, r21
  ADD r10, r0
  PSET r10, r20, r21
  ADD r10, r0
  PSET r10, r20, r21
  ADD r10, r0
  PSET r10, r20, r21
  LDI r10, 241
  LDI r7, 11
  PSET r10, r7, r21
  LDI r7, 13
  PSET r10, r7, r21
  JMP hud_done

hud_dot:
  PSET r20, r20, r21

hud_done:
  POP r13

  FRAME
  JMP main_loop

; ===== Subroutine: bounce_particle =====
; Bounces particle (r10=x, r7=y, r15=vx, r5=vy) off screen edges
; Modifies r10, r7, r15, r5 in place
bounce_particle:
  PUSH r31
  PUSH r13

  ; Right wall (x > 254)
  LDI r18, 254
  CMP r10, r18
  BLT r13, bp_x_low
  LDI r10, 254
  CALL damp_neg          ; negate and damp r15
bp_x_low:
  ; Left wall (x as signed < 0)
  MOV r18, r10
  LDI r19, 0
  CMP r18, r19
  BGE r13, bp_y_high
  LDI r10, 0
  CALL damp_neg

bp_y_high:
  ; Bottom wall (y > 254)
  LDI r18, 254
  CMP r7, r18
  BLT r13, bp_y_low
  LDI r7, 254
  CALL damp_neg_vy

bp_y_low:
  MOV r18, r7
  LDI r19, 0
  CMP r18, r19
  BGE r13, bp_done
  LDI r7, 0
  CALL damp_neg_vy

bp_done:
  POP r13
  POP r31
  RET

; ===== Subroutine: damp_neg =====
; Negate r15 and apply damping (lose 1 from absolute value)
damp_neg:
  PUSH r13
  NEG r15
  ; Dampen: reduce |r15| by 1
  LDI r18, 0
  CMP r15, r18
  BGE r13, dn_pos
  ; r15 is negative: negate, sub 1, if 0 set to 0, else negate back
  NEG r15
  SUB r15, r0
  JZ r15, dn_zero
  NEG r15
  JMP dn_done
dn_pos:
  SUB r15, r0
  JZ r15, dn_zero
  JMP dn_done
dn_zero:
  LDI r15, 0
dn_done:
  POP r13
  RET

; ===== Subroutine: damp_neg_vy =====
; Negate r5 and apply damping
damp_neg_vy:
  PUSH r13
  NEG r5
  LDI r18, 0
  CMP r5, r18
  BGE r13, dv_pos
  NEG r5
  SUB r5, r0
  JZ r5, dv_zero
  NEG r5
  JMP dv_done
dv_pos:
  SUB r5, r0
  JZ r5, dv_zero
  JMP dv_done
dv_zero:
  LDI r5, 0
dv_done:
  POP r13
  RET

; ===== Subroutine: compute_color =====
; Sets r11 = color based on particle velocity (r15=vx, r5=vy)
compute_color:
  PUSH r13
  ; speed = |vx| + |vy|, clamped to 0..15
  MOV r18, r15
  LDI r19, 0
  CMP r18, r19
  BGE r13, cc_vx_pos
  NEG r18
cc_vx_pos:
  MOV r6, r18

  MOV r18, r5
  LDI r19, 0
  CMP r18, r19
  BGE r13, cc_vy_pos
  NEG r18
cc_vy_pos:
  ADD r6, r18

  ; Clamp to 15
  LDI r18, 15
  CMP r6, r18
  BLT r13, cc_lookup
  MOV r6, r18

cc_lookup:
  LDI r18, 0x7600
  ADD r18, r6
  LOAD r11, r18

  POP r13
  RET

; ===== Subroutine: spawn_burst =====
; Spawns 8 particles at (r3, r8) with random velocities
spawn_burst:
  PUSH r31
  PUSH r13

  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r13, sb_done

  ; Address = base + count * 4
  MOV r14, r23
  MOV r12, r18
  LDI r17, 4
  MUL r12, r17
  ADD r14, r12

  ; x = center + random(-8..7)
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r3
  ADD r18, r17
  STORE r14, r18

  ; y = center + random(-8..7)
  ADD r14, r0
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r8
  ADD r18, r17
  STORE r14, r18

  ; vx = random(-3..4)
  ADD r14, r0
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r14, r17

  ; vy = random(-5..2)
  ADD r14, r0
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r14, r17

  ; Increment count
  LOAD r18, r26
  ADD r18, r0
  STORE r26, r18

  SUB r16, r0
  JNZ r16, sb_loop

sb_done:
  POP r13
  POP r31
  RET
