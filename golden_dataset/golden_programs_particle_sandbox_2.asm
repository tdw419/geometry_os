; DESCRIPTION: This GeOS assembly code implements a real-time particle physics sandbox simulation. It includes gravity effects, wall collisions with damping, interactive particle spawning via keyboard inputs, and velocity-based coloring of particles. The program uses memory-mapped I/O for state management and handles user controls to adjust gravity direction and reset the simulation.

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
LDI r10, 1
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
LDI r5, 0x7600
LDI r0, 0x0000FF         ; 0 - blue
STORE r5, r0
ADD r5, r10
LDI r0, 0x0022FF         ; 1 - blue-cyan
STORE r5, r0
ADD r5, r10
LDI r0, 0x0066FF         ; 2 - cyan
STORE r5, r0
ADD r5, r10
LDI r0, 0x00AAFF         ; 3 - cyan-green
STORE r5, r0
ADD r5, r10
LDI r0, 0x00FFAA         ; 4 - green-cyan
STORE r5, r0
ADD r5, r10
LDI r0, 0x00FF66         ; 5 - green
STORE r5, r0
ADD r5, r10
LDI r0, 0x00FF22         ; 6 - green-yellow
STORE r5, r0
ADD r5, r10
LDI r0, 0x44FF00         ; 7 - yellow-green
STORE r5, r0
ADD r5, r10
LDI r0, 0x88FF00         ; 8 - yellow
STORE r5, r0
ADD r5, r10
LDI r0, 0xCCFF00         ; 9 - yellow
STORE r5, r0
ADD r5, r10
LDI r0, 0xFFFF00         ; 10 - yellow-orange
STORE r5, r0
ADD r5, r10
LDI r0, 0xFFAA00         ; 11 - orange
STORE r5, r0
ADD r5, r10
LDI r0, 0xFF6600         ; 12 - orange
STORE r5, r0
ADD r5, r10
LDI r0, 0xFF2200         ; 13 - red-orange
STORE r5, r0
ADD r5, r10
LDI r0, 0xFF0000         ; 14 - red
STORE r5, r0
ADD r5, r10
LDI r0, 0xFF0044         ; 15 - red-pink
STORE r5, r0

; ===== Initialize State =====
LDI r18, 0
STORE r24, r18            ; gravity_x = 0
LDI r18, 1
STORE r25, r18            ; gravity_y = 1 (down)
STORE r26, r18            ; particle_count = 0
STORE r27, r18            ; frame_counter = 0

; ===== Initial Burst =====
LDI r4, 128
LDI r3, 128
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
  ADD r18, r10
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
  LDI r4, 128
  LDI r3, 128
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
  LOAD r9, r26           ; particle_count
  JZ r9, draw_hud

  LDI r7, 0              ; index = 0

update_loop:
  ; Address = base + index * 4
  MOV r5, r23
  MOV r0, r7
  LDI r18, 4
  MUL r0, r18
  ADD r5, r0

  ; Load particle
  LOAD r6, r5            ; x
  ADD r5, r10
  LOAD r11, r5            ; y
  ADD r5, r10
  LOAD r8, r5            ; vx
  ADD r5, r10
  LOAD r14, r5            ; vy

  ; Apply gravity
  PUSH r13
  LOAD r18, r24
  ADD r8, r18             ; vx += gx
  LOAD r18, r25
  ADD r14, r18             ; vy += gy
  POP r13

  ; Update position
  ADD r6, r8              ; x += vx
  ADD r11, r14              ; y += vy

  ; Bounce off walls with damping
  CALL bounce_particle

  ; Store updated state
  MOV r5, r23
  MOV r0, r7
  LDI r18, 4
  MUL r0, r18
  ADD r5, r0

  STORE r5, r6           ; x
  ADD r5, r10
  STORE r5, r11           ; y
  ADD r5, r10
  STORE r5, r8           ; vx
  ADD r5, r10
  STORE r5, r14           ; vy

  ; Color by speed
  CALL compute_color

  ; Draw 2x2 particle
  PSET r6, r11, r12
  MOV r18, r6
  ADD r18, r10
  PSET r18, r11, r12
  MOV r18, r11
  ADD r18, r10
  PSET r6, r18, r12
  MOV r18, r6
  ADD r18, r10
  PSET r18, r18, r12

  ; Next particle
  ADD r7, r10
  CMP r7, r9
  BLT r13, update_loop

draw_hud:
  ; Draw gravity arrow indicator at top-right
  LOAD r18, r24           ; gx
  LOAD r19, r25           ; gy
  LDI r20, 245            ; arrow center x
  LDI r6, 12              ; arrow center y
  LDI r21, 0xFFFF00       ; yellow

  PUSH r13
  LDI r22, 0

  ; Check if gravity_y nonzero
  CMP r19, r22
  JZ r13, hud_check_gx
  BGE r13, hud_arrow_down

  ; Up arrow
  LDI r6, 8
  PSET r20, r6, r21
  ADD r6, r10
  PSET r20, r6, r21
  ADD r6, r10
  PSET r20, r6, r21
  ADD r6, r10
  PSET r20, r6, r21
  ADD r6, r10
  PSET r20, r6, r21
  LDI r6, 8
  LDI r11, 244
  PSET r11, r6, r21
  LDI r11, 246
  PSET r11, r6, r21
  JMP hud_done

hud_arrow_down:
  LDI r6, 12
  PSET r20, r6, r21
  ADD r6, r10
  PSET r20, r6, r21
  ADD r6, r10
  PSET r20, r6, r21
  ADD r6, r10
  PSET r20, r6, r21
  ADD r6, r10
  PSET r20, r6, r21
  LDI r6, 16
  LDI r11, 244
  PSET r11, r6, r21
  LDI r11, 246
  PSET r11, r6, r21
  JMP hud_done

hud_check_gx:
  CMP r18, r22
  JZ r13, hud_dot

  ; Left arrow
  LDI r6, 241
  PSET r6, r20, r21
  ADD r6, r10
  PSET r6, r20, r21
  ADD r6, r10
  PSET r6, r20, r21
  ADD r6, r10
  PSET r6, r20, r21
  ADD r6, r10
  PSET r6, r20, r21
  LDI r6, 241
  LDI r11, 11
  PSET r6, r11, r21
  LDI r11, 13
  PSET r6, r11, r21
  JMP hud_done

hud_dot:
  PSET r20, r20, r21

hud_done:
  POP r13

  FRAME
  JMP main_loop

; ===== Subroutine: bounce_particle =====
; Bounces particle (r6=x, r11=y, r8=vx, r14=vy) off screen edges
; Modifies r6, r11, r8, r14 in place
bounce_particle:
  PUSH r31
  PUSH r13

  ; Right wall (x > 254)
  LDI r18, 254
  CMP r6, r18
  BLT r13, bp_x_low
  LDI r6, 254
  CALL damp_neg          ; negate and damp r8
bp_x_low:
  ; Left wall (x as signed < 0)
  MOV r18, r6
  LDI r19, 0
  CMP r18, r19
  BGE r13, bp_y_high
  LDI r6, 0
  CALL damp_neg

bp_y_high:
  ; Bottom wall (y > 254)
  LDI r18, 254
  CMP r11, r18
  BLT r13, bp_y_low
  LDI r11, 254
  CALL damp_neg_vy

bp_y_low:
  MOV r18, r11
  LDI r19, 0
  CMP r18, r19
  BGE r13, bp_done
  LDI r11, 0
  CALL damp_neg_vy

bp_done:
  POP r13
  POP r31
  RET

; ===== Subroutine: damp_neg =====
; Negate r8 and apply damping (lose 1 from absolute value)
damp_neg:
  PUSH r13
  NEG r8
  ; Dampen: reduce |r8| by 1
  LDI r18, 0
  CMP r8, r18
  BGE r13, dn_pos
  ; r8 is negative: negate, sub 1, if 0 set to 0, else negate back
  NEG r8
  SUB r8, r10
  JZ r8, dn_zero
  NEG r8
  JMP dn_done
dn_pos:
  SUB r8, r10
  JZ r8, dn_zero
  JMP dn_done
dn_zero:
  LDI r8, 0
dn_done:
  POP r13
  RET

; ===== Subroutine: damp_neg_vy =====
; Negate r14 and apply damping
damp_neg_vy:
  PUSH r13
  NEG r14
  LDI r18, 0
  CMP r14, r18
  BGE r13, dv_pos
  NEG r14
  SUB r14, r10
  JZ r14, dv_zero
  NEG r14
  JMP dv_done
dv_pos:
  SUB r14, r10
  JZ r14, dv_zero
  JMP dv_done
dv_zero:
  LDI r14, 0
dv_done:
  POP r13
  RET

; ===== Subroutine: compute_color =====
; Sets r12 = color based on particle velocity (r8=vx, r14=vy)
compute_color:
  PUSH r13
  ; speed = |vx| + |vy|, clamped to 0..15
  MOV r18, r8
  LDI r19, 0
  CMP r18, r19
  BGE r13, cc_vx_pos
  NEG r18
cc_vx_pos:
  MOV r15, r18

  MOV r18, r14
  LDI r19, 0
  CMP r18, r19
  BGE r13, cc_vy_pos
  NEG r18
cc_vy_pos:
  ADD r15, r18

  ; Clamp to 15
  LDI r18, 15
  CMP r15, r18
  BLT r13, cc_lookup
  MOV r15, r18

cc_lookup:
  LDI r18, 0x7600
  ADD r18, r15
  LOAD r12, r18

  POP r13
  RET

; ===== Subroutine: spawn_burst =====
; Spawns 8 particles at (r4, r3) with random velocities
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
  MOV r5, r23
  MOV r0, r18
  LDI r17, 4
  MUL r0, r17
  ADD r5, r0

  ; x = center + random(-8..7)
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r4
  ADD r18, r17
  STORE r5, r18

  ; y = center + random(-8..7)
  ADD r5, r10
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r3
  ADD r18, r17
  STORE r5, r18

  ; vx = random(-3..4)
  ADD r5, r10
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r5, r17

  ; vy = random(-5..2)
  ADD r5, r10
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r5, r17

  ; Increment count
  LOAD r18, r26
  ADD r18, r10
  STORE r26, r18

  SUB r16, r10
  JNZ r16, sb_loop

sb_done:
  POP r13
  POP r31
  RET
