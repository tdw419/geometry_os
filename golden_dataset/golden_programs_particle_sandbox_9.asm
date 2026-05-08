; DESCRIPTION: Geometry OS program to draw a colored rectangle.

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
LDI r7, 1
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
LDI r8, 0x7600
LDI r14, 0x0000FF         ; 0 - blue
STORE r8, r14
ADD r8, r7
LDI r14, 0x0022FF         ; 1 - blue-cyan
STORE r8, r14
ADD r8, r7
LDI r14, 0x0066FF         ; 2 - cyan
STORE r8, r14
ADD r8, r7
LDI r14, 0x00AAFF         ; 3 - cyan-green
STORE r8, r14
ADD r8, r7
LDI r14, 0x00FFAA         ; 4 - green-cyan
STORE r8, r14
ADD r8, r7
LDI r14, 0x00FF66         ; 5 - green
STORE r8, r14
ADD r8, r7
LDI r14, 0x00FF22         ; 6 - green-yellow
STORE r8, r14
ADD r8, r7
LDI r14, 0x44FF00         ; 7 - yellow-green
STORE r8, r14
ADD r8, r7
LDI r14, 0x88FF00         ; 8 - yellow
STORE r8, r14
ADD r8, r7
LDI r14, 0xCCFF00         ; 9 - yellow
STORE r8, r14
ADD r8, r7
LDI r14, 0xFFFF00         ; 10 - yellow-orange
STORE r8, r14
ADD r8, r7
LDI r14, 0xFFAA00         ; 11 - orange
STORE r8, r14
ADD r8, r7
LDI r14, 0xFF6600         ; 12 - orange
STORE r8, r14
ADD r8, r7
LDI r14, 0xFF2200         ; 13 - red-orange
STORE r8, r14
ADD r8, r7
LDI r14, 0xFF0000         ; 14 - red
STORE r8, r14
ADD r8, r7
LDI r14, 0xFF0044         ; 15 - red-pink
STORE r8, r14

; ===== Initialize State =====
LDI r18, 0
STORE r24, r18            ; gravity_x = 0
LDI r18, 1
STORE r25, r18            ; gravity_y = 1 (down)
STORE r26, r18            ; particle_count = 0
STORE r27, r18            ; frame_counter = 0

; ===== Initial Burst =====
LDI r13, 128
LDI r4, 128
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
  ADD r18, r7
  STORE r27, r18

  ; Read keyboard
  IKEY r19

  ; Space = spawn at center
  LDI r18, 32
  CMP r19, r18
  JZ r12, do_spawn

  ; W = gravity up
  LDI r18, 87
  CMP r19, r18
  JZ r12, grav_up
  LDI r18, 119
  CMP r19, r18
  JZ r12, grav_up

  ; S = gravity down
  LDI r18, 83
  CMP r19, r18
  JZ r12, grav_down
  LDI r18, 115
  CMP r19, r18
  JZ r12, grav_down

  ; A = gravity left
  LDI r18, 65
  CMP r19, r18
  JZ r12, grav_left
  LDI r18, 97
  CMP r19, r18
  JZ r12, grav_left

  ; D = gravity right
  LDI r18, 68
  CMP r19, r18
  JZ r12, grav_right
  LDI r18, 100
  CMP r19, r18
  JZ r12, grav_right

  ; R = reset
  LDI r18, 82
  CMP r19, r18
  JZ r12, do_reset
  LDI r18, 114
  CMP r19, r18
  JZ r12, do_reset

  ; G = zero gravity
  LDI r18, 71
  CMP r19, r18
  JZ r12, grav_zero
  LDI r18, 103
  CMP r19, r18
  JZ r12, grav_zero

  JMP after_input

do_spawn:
  LDI r13, 128
  LDI r4, 128
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
  LOAD r3, r26           ; particle_count
  JZ r3, draw_hud

  LDI r5, 0              ; index = 0

update_loop:
  ; Address = base + index * 4
  MOV r8, r23
  MOV r14, r5
  LDI r18, 4
  MUL r14, r18
  ADD r8, r14

  ; Load particle
  LOAD r9, r8            ; x
  ADD r8, r7
  LOAD r15, r8            ; y
  ADD r8, r7
  LOAD r0, r8            ; vx
  ADD r8, r7
  LOAD r10, r8            ; vy

  ; Apply gravity
  PUSH r12
  LOAD r18, r24
  ADD r0, r18             ; vx += gx
  LOAD r18, r25
  ADD r10, r18             ; vy += gy
  POP r12

  ; Update position
  ADD r9, r0              ; x += vx
  ADD r15, r10              ; y += vy

  ; Bounce off walls with damping
  CALL bounce_particle

  ; Store updated state
  MOV r8, r23
  MOV r14, r5
  LDI r18, 4
  MUL r14, r18
  ADD r8, r14

  STORE r8, r9           ; x
  ADD r8, r7
  STORE r8, r15           ; y
  ADD r8, r7
  STORE r8, r0           ; vx
  ADD r8, r7
  STORE r8, r10           ; vy

  ; Color by speed
  CALL compute_color

  ; Draw 2x2 particle
  PSET r9, r15, r11
  MOV r18, r9
  ADD r18, r7
  PSET r18, r15, r11
  MOV r18, r15
  ADD r18, r7
  PSET r9, r18, r11
  MOV r18, r9
  ADD r18, r7
  PSET r18, r18, r11

  ; Next particle
  ADD r5, r7
  CMP r5, r3
  BLT r12, update_loop

draw_hud:
  ; Draw gravity arrow indicator at top-right
  LOAD r18, r24           ; gx
  LOAD r19, r25           ; gy
  LDI r20, 245            ; arrow center x
  LDI r9, 12              ; arrow center y
  LDI r21, 0xFFFF00       ; yellow

  PUSH r12
  LDI r22, 0

  ; Check if gravity_y nonzero
  CMP r19, r22
  JZ r12, hud_check_gx
  BGE r12, hud_arrow_down

  ; Up arrow
  LDI r9, 8
  PSET r20, r9, r21
  ADD r9, r7
  PSET r20, r9, r21
  ADD r9, r7
  PSET r20, r9, r21
  ADD r9, r7
  PSET r20, r9, r21
  ADD r9, r7
  PSET r20, r9, r21
  LDI r9, 8
  LDI r15, 244
  PSET r15, r9, r21
  LDI r15, 246
  PSET r15, r9, r21
  JMP hud_done

hud_arrow_down:
  LDI r9, 12
  PSET r20, r9, r21
  ADD r9, r7
  PSET r20, r9, r21
  ADD r9, r7
  PSET r20, r9, r21
  ADD r9, r7
  PSET r20, r9, r21
  ADD r9, r7
  PSET r20, r9, r21
  LDI r9, 16
  LDI r15, 244
  PSET r15, r9, r21
  LDI r15, 246
  PSET r15, r9, r21
  JMP hud_done

hud_check_gx:
  CMP r18, r22
  JZ r12, hud_dot

  ; Left arrow
  LDI r9, 241
  PSET r9, r20, r21
  ADD r9, r7
  PSET r9, r20, r21
  ADD r9, r7
  PSET r9, r20, r21
  ADD r9, r7
  PSET r9, r20, r21
  ADD r9, r7
  PSET r9, r20, r21
  LDI r9, 241
  LDI r15, 11
  PSET r9, r15, r21
  LDI r15, 13
  PSET r9, r15, r21
  JMP hud_done

hud_dot:
  PSET r20, r20, r21

hud_done:
  POP r12

  FRAME
  JMP main_loop

; ===== Subroutine: bounce_particle =====
; Bounces particle (r9=x, r15=y, r0=vx, r10=vy) off screen edges
; Modifies r9, r15, r0, r10 in place
bounce_particle:
  PUSH r31
  PUSH r12

  ; Right wall (x > 254)
  LDI r18, 254
  CMP r9, r18
  BLT r12, bp_x_low
  LDI r9, 254
  CALL damp_neg          ; negate and damp r0
bp_x_low:
  ; Left wall (x as signed < 0)
  MOV r18, r9
  LDI r19, 0
  CMP r18, r19
  BGE r12, bp_y_high
  LDI r9, 0
  CALL damp_neg

bp_y_high:
  ; Bottom wall (y > 254)
  LDI r18, 254
  CMP r15, r18
  BLT r12, bp_y_low
  LDI r15, 254
  CALL damp_neg_vy

bp_y_low:
  MOV r18, r15
  LDI r19, 0
  CMP r18, r19
  BGE r12, bp_done
  LDI r15, 0
  CALL damp_neg_vy

bp_done:
  POP r12
  POP r31
  RET

; ===== Subroutine: damp_neg =====
; Negate r0 and apply damping (lose 1 from absolute value)
damp_neg:
  PUSH r12
  NEG r0
  ; Dampen: reduce |r0| by 1
  LDI r18, 0
  CMP r0, r18
  BGE r12, dn_pos
  ; r0 is negative: negate, sub 1, if 0 set to 0, else negate back
  NEG r0
  SUB r0, r7
  JZ r0, dn_zero
  NEG r0
  JMP dn_done
dn_pos:
  SUB r0, r7
  JZ r0, dn_zero
  JMP dn_done
dn_zero:
  LDI r0, 0
dn_done:
  POP r12
  RET

; ===== Subroutine: damp_neg_vy =====
; Negate r10 and apply damping
damp_neg_vy:
  PUSH r12
  NEG r10
  LDI r18, 0
  CMP r10, r18
  BGE r12, dv_pos
  NEG r10
  SUB r10, r7
  JZ r10, dv_zero
  NEG r10
  JMP dv_done
dv_pos:
  SUB r10, r7
  JZ r10, dv_zero
  JMP dv_done
dv_zero:
  LDI r10, 0
dv_done:
  POP r12
  RET

; ===== Subroutine: compute_color =====
; Sets r11 = color based on particle velocity (r0=vx, r10=vy)
compute_color:
  PUSH r12
  ; speed = |vx| + |vy|, clamped to 0..15
  MOV r18, r0
  LDI r19, 0
  CMP r18, r19
  BGE r12, cc_vx_pos
  NEG r18
cc_vx_pos:
  MOV r6, r18

  MOV r18, r10
  LDI r19, 0
  CMP r18, r19
  BGE r12, cc_vy_pos
  NEG r18
cc_vy_pos:
  ADD r6, r18

  ; Clamp to 15
  LDI r18, 15
  CMP r6, r18
  BLT r12, cc_lookup
  MOV r6, r18

cc_lookup:
  LDI r18, 0x7600
  ADD r18, r6
  LOAD r11, r18

  POP r12
  RET

; ===== Subroutine: spawn_burst =====
; Spawns 8 particles at (r13, r4) with random velocities
spawn_burst:
  PUSH r31
  PUSH r12

  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r12, sb_done

  ; Address = base + count * 4
  MOV r8, r23
  MOV r14, r18
  LDI r17, 4
  MUL r14, r17
  ADD r8, r14

  ; x = center + random(-8..7)
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r13
  ADD r18, r17
  STORE r8, r18

  ; y = center + random(-8..7)
  ADD r8, r7
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r4
  ADD r18, r17
  STORE r8, r18

  ; vx = random(-3..4)
  ADD r8, r7
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r8, r17

  ; vy = random(-5..2)
  ADD r8, r7
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r8, r17

  ; Increment count
  LOAD r18, r26
  ADD r18, r7
  STORE r26, r18

  SUB r16, r7
  JNZ r16, sb_loop

sb_done:
  POP r12
  POP r31
  RET
