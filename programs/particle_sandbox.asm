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
LDI r14, 0x7600
LDI r15, 0x0000FF         ; 0 - blue
STORE r14, r15
ADD r14, r7
LDI r15, 0x0022FF         ; 1 - blue-cyan
STORE r14, r15
ADD r14, r7
LDI r15, 0x0066FF         ; 2 - cyan
STORE r14, r15
ADD r14, r7
LDI r15, 0x00AAFF         ; 3 - cyan-green
STORE r14, r15
ADD r14, r7
LDI r15, 0x00FFAA         ; 4 - green-cyan
STORE r14, r15
ADD r14, r7
LDI r15, 0x00FF66         ; 5 - green
STORE r14, r15
ADD r14, r7
LDI r15, 0x00FF22         ; 6 - green-yellow
STORE r14, r15
ADD r14, r7
LDI r15, 0x44FF00         ; 7 - yellow-green
STORE r14, r15
ADD r14, r7
LDI r15, 0x88FF00         ; 8 - yellow
STORE r14, r15
ADD r14, r7
LDI r15, 0xCCFF00         ; 9 - yellow
STORE r14, r15
ADD r14, r7
LDI r15, 0xFFFF00         ; 10 - yellow-orange
STORE r14, r15
ADD r14, r7
LDI r15, 0xFFAA00         ; 11 - orange
STORE r14, r15
ADD r14, r7
LDI r15, 0xFF6600         ; 12 - orange
STORE r14, r15
ADD r14, r7
LDI r15, 0xFF2200         ; 13 - red-orange
STORE r14, r15
ADD r14, r7
LDI r15, 0xFF0000         ; 14 - red
STORE r14, r15
ADD r14, r7
LDI r15, 0xFF0044         ; 15 - red-pink
STORE r14, r15

; ===== Initialize State =====
LDI r18, 0
STORE r24, r18            ; gravity_x = 0
LDI r18, 1
STORE r25, r18            ; gravity_y = 1 (down)
STORE r26, r18            ; particle_count = 0
STORE r27, r18            ; frame_counter = 0

; ===== Initial Burst =====
LDI r10, 128
LDI r11, 128
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
  JZ r0, do_spawn

  ; W = gravity up
  LDI r18, 87
  CMP r19, r18
  JZ r0, grav_up
  LDI r18, 119
  CMP r19, r18
  JZ r0, grav_up

  ; S = gravity down
  LDI r18, 83
  CMP r19, r18
  JZ r0, grav_down
  LDI r18, 115
  CMP r19, r18
  JZ r0, grav_down

  ; A = gravity left
  LDI r18, 65
  CMP r19, r18
  JZ r0, grav_left
  LDI r18, 97
  CMP r19, r18
  JZ r0, grav_left

  ; D = gravity right
  LDI r18, 68
  CMP r19, r18
  JZ r0, grav_right
  LDI r18, 100
  CMP r19, r18
  JZ r0, grav_right

  ; R = reset
  LDI r18, 82
  CMP r19, r18
  JZ r0, do_reset
  LDI r18, 114
  CMP r19, r18
  JZ r0, do_reset

  ; G = zero gravity
  LDI r18, 71
  CMP r19, r18
  JZ r0, grav_zero
  LDI r18, 103
  CMP r19, r18
  JZ r0, grav_zero

  JMP after_input

do_spawn:
  LDI r10, 128
  LDI r11, 128
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
  LOAD r12, r26           ; particle_count
  JZ r12, draw_hud

  LDI r13, 0              ; index = 0

update_loop:
  ; Address = base + index * 4
  MOV r14, r23
  MOV r15, r13
  LDI r18, 4
  MUL r15, r18
  ADD r14, r15

  ; Load particle
  LOAD r1, r14            ; x
  ADD r14, r7
  LOAD r2, r14            ; y
  ADD r14, r7
  LOAD r3, r14            ; vx
  ADD r14, r7
  LOAD r4, r14            ; vy

  ; Apply gravity
  PUSH r0
  LOAD r18, r24
  ADD r3, r18             ; vx += gx
  LOAD r18, r25
  ADD r4, r18             ; vy += gy
  POP r0

  ; Update position
  ADD r1, r3              ; x += vx
  ADD r2, r4              ; y += vy

  ; Bounce off walls with damping
  CALL bounce_particle

  ; Store updated state
  MOV r14, r23
  MOV r15, r13
  LDI r18, 4
  MUL r15, r18
  ADD r14, r15

  STORE r14, r1           ; x
  ADD r14, r7
  STORE r14, r2           ; y
  ADD r14, r7
  STORE r14, r3           ; vx
  ADD r14, r7
  STORE r14, r4           ; vy

  ; Color by speed
  CALL compute_color

  ; Draw 2x2 particle
  PSET r1, r2, r6
  MOV r18, r1
  ADD r18, r7
  PSET r18, r2, r6
  MOV r18, r2
  ADD r18, r7
  PSET r1, r18, r6
  MOV r18, r1
  ADD r18, r7
  PSET r18, r18, r6

  ; Next particle
  ADD r13, r7
  CMP r13, r12
  BLT r0, update_loop

draw_hud:
  ; Draw gravity arrow indicator at top-right
  LOAD r18, r24           ; gx
  LOAD r19, r25           ; gy
  LDI r20, 245            ; arrow center x
  LDI r1, 12              ; arrow center y
  LDI r21, 0xFFFF00       ; yellow

  PUSH r0
  LDI r22, 0

  ; Check if gravity_y nonzero
  CMP r19, r22
  JZ r0, hud_check_gx
  BGE r0, hud_arrow_down

  ; Up arrow
  LDI r1, 8
  PSET r20, r1, r21
  ADD r1, r7
  PSET r20, r1, r21
  ADD r1, r7
  PSET r20, r1, r21
  ADD r1, r7
  PSET r20, r1, r21
  ADD r1, r7
  PSET r20, r1, r21
  LDI r1, 8
  LDI r2, 244
  PSET r2, r1, r21
  LDI r2, 246
  PSET r2, r1, r21
  JMP hud_done

hud_arrow_down:
  LDI r1, 12
  PSET r20, r1, r21
  ADD r1, r7
  PSET r20, r1, r21
  ADD r1, r7
  PSET r20, r1, r21
  ADD r1, r7
  PSET r20, r1, r21
  ADD r1, r7
  PSET r20, r1, r21
  LDI r1, 16
  LDI r2, 244
  PSET r2, r1, r21
  LDI r2, 246
  PSET r2, r1, r21
  JMP hud_done

hud_check_gx:
  CMP r18, r22
  JZ r0, hud_dot

  ; Left arrow
  LDI r1, 241
  PSET r1, r20, r21
  ADD r1, r7
  PSET r1, r20, r21
  ADD r1, r7
  PSET r1, r20, r21
  ADD r1, r7
  PSET r1, r20, r21
  ADD r1, r7
  PSET r1, r20, r21
  LDI r1, 241
  LDI r2, 11
  PSET r1, r2, r21
  LDI r2, 13
  PSET r1, r2, r21
  JMP hud_done

hud_dot:
  PSET r20, r20, r21

hud_done:
  POP r0

  FRAME
  JMP main_loop

; ===== Subroutine: bounce_particle =====
; Bounces particle (r1=x, r2=y, r3=vx, r4=vy) off screen edges
; Modifies r1, r2, r3, r4 in place
bounce_particle:
  PUSH r31
  PUSH r0

  ; Right wall (x > 254)
  LDI r18, 254
  CMP r1, r18
  BLT r0, bp_x_low
  LDI r1, 254
  CALL damp_neg          ; negate and damp r3
bp_x_low:
  ; Left wall (x as signed < 0)
  MOV r18, r1
  LDI r19, 0
  CMP r18, r19
  BGE r0, bp_y_high
  LDI r1, 0
  CALL damp_neg

bp_y_high:
  ; Bottom wall (y > 254)
  LDI r18, 254
  CMP r2, r18
  BLT r0, bp_y_low
  LDI r2, 254
  CALL damp_neg_vy

bp_y_low:
  MOV r18, r2
  LDI r19, 0
  CMP r18, r19
  BGE r0, bp_done
  LDI r2, 0
  CALL damp_neg_vy

bp_done:
  POP r0
  POP r31
  RET

; ===== Subroutine: damp_neg =====
; Negate r3 and apply damping (lose 1 from absolute value)
damp_neg:
  PUSH r0
  NEG r3
  ; Dampen: reduce |r3| by 1
  LDI r18, 0
  CMP r3, r18
  BGE r0, dn_pos
  ; r3 is negative: negate, sub 1, if 0 set to 0, else negate back
  NEG r3
  SUB r3, r7
  JZ r3, dn_zero
  NEG r3
  JMP dn_done
dn_pos:
  SUB r3, r7
  JZ r3, dn_zero
  JMP dn_done
dn_zero:
  LDI r3, 0
dn_done:
  POP r0
  RET

; ===== Subroutine: damp_neg_vy =====
; Negate r4 and apply damping
damp_neg_vy:
  PUSH r0
  NEG r4
  LDI r18, 0
  CMP r4, r18
  BGE r0, dv_pos
  NEG r4
  SUB r4, r7
  JZ r4, dv_zero
  NEG r4
  JMP dv_done
dv_pos:
  SUB r4, r7
  JZ r4, dv_zero
  JMP dv_done
dv_zero:
  LDI r4, 0
dv_done:
  POP r0
  RET

; ===== Subroutine: compute_color =====
; Sets r6 = color based on particle velocity (r3=vx, r4=vy)
compute_color:
  PUSH r0
  ; speed = |vx| + |vy|, clamped to 0..15
  MOV r18, r3
  LDI r19, 0
  CMP r18, r19
  BGE r0, cc_vx_pos
  NEG r18
cc_vx_pos:
  MOV r5, r18

  MOV r18, r4
  LDI r19, 0
  CMP r18, r19
  BGE r0, cc_vy_pos
  NEG r18
cc_vy_pos:
  ADD r5, r18

  ; Clamp to 15
  LDI r18, 15
  CMP r5, r18
  BLT r0, cc_lookup
  MOV r5, r18

cc_lookup:
  LDI r18, 0x7600
  ADD r18, r5
  LOAD r6, r18

  POP r0
  RET

; ===== Subroutine: spawn_burst =====
; Spawns 8 particles at (r10, r11) with random velocities
spawn_burst:
  PUSH r31
  PUSH r0

  LDI r16, 8

sb_loop:
  LOAD r18, r26
  LDI r17, 128
  CMP r18, r17
  BGE r0, sb_done

  ; Address = base + count * 4
  MOV r14, r23
  MOV r15, r18
  LDI r17, 4
  MUL r15, r17
  ADD r14, r15

  ; x = center + random(-8..7)
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r10
  ADD r18, r17
  STORE r14, r18

  ; y = center + random(-8..7)
  ADD r14, r7
  RAND r17
  LDI r18, 15
  AND r17, r18
  LDI r18, 8
  SUB r17, r18
  MOV r18, r11
  ADD r18, r17
  STORE r14, r18

  ; vx = random(-3..4)
  ADD r14, r7
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 3
  SUB r17, r18
  STORE r14, r17

  ; vy = random(-5..2)
  ADD r14, r7
  RAND r17
  LDI r18, 7
  AND r17, r18
  LDI r18, 5
  SUB r17, r18
  STORE r14, r17

  ; Increment count
  LOAD r18, r26
  ADD r18, r7
  STORE r26, r18

  SUB r16, r7
  JNZ r16, sb_loop

sb_done:
  POP r0
  POP r31
  RET
