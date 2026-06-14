; gravity_sim.asm -- N-body gravitational simulation with orbital trails
; Controls: Space=spawn body, R=reset, C=clear trails
;
; Physics:
;   Simplified gravity: F = G * m1 * m2 / (dx^2 + dy^2)
;   Direct position update: x += vx, y += vy
;
; Memory layout:
;   0x2000        particle_count (max 8)
;   0x2001        G_constant (gravitational constant)
;   0x3000-0x30FF Trail buffer (256 words, stores packed (x,y) pairs)
;   0x4000-0x403F Particles (8 * 8 words):
;                    x y vx vy mass color trail_len trail_idx
;
;   Trail format: each trail entry stores 2 words (x, y as integers)
;   Trail storage: circular buffer starting at 0x3000

; ─── CONSTANTS ───────────────────────────────────────────────
; MAX_PARTICLES = 8
; PARTICLE_SIZE = 8
; TRAIL_BUFFER = 0x3000
; PARTICLE_BASE = 0x4000

; ─── ENTRY ─────────────────────────────────────────────────
restart:
  ; Initialize stack
  LDI r30, 0xFE00
  PUSH r31

  CALL init_simulation
  JMP main_loop

; ─── INITIALIZATION ───────────────────────────────────────
init_simulation:
  ; Set particle_count = 0
  LDI r10, 0x2000
  LDI r11, 0
  STORE r10, r11

  ; Set G_constant = 10 (tuned for screen coordinates)
  ADDI r10, 1
  LDI r11, 10
  STORE r10, r11

  ; Spawn central star (massive, stationary, yellow)
  LDI r10, 128     ; x = 128
  LDI r11, 128     ; y = 128
  LDI r12, 0       ; vx = 0
  LDI r13, 0       ; vy = 0
  LDI r14, 500     ; mass = 500
  LDI r15, 0xFFFF00 ; color = yellow
  LDI r16, 64      ; trail_len
  CALL spawn_particle

  ; Spawn orbiting planet 1 (cyan)
  LDI r10, 208     ; x = 128 + 80
  LDI r11, 128     ; y = 128
  LDI r12, 0       ; vx = 0
  LDI r13, 3       ; vy = 3 (orbital velocity)
  LDI r14, 50      ; mass = 50
  LDI r15, 0x00FFFF ; color = cyan
  LDI r16, 32      ; trail_len
  CALL spawn_particle

  ; Spawn orbiting planet 2 (green)
  LDI r10, 78      ; x = 128 - 50
  LDI r11, 168     ; y = 128 + 40
  LDI r12, 3       ; vx = 3
  LDI r13, 0xFFFFFFFD ; vy = -3 (two's complement)
  LDI r14, 80      ; mass = 80
  LDI r15, 0x00FF00 ; color = green
  LDI r16, 24      ; trail_len
  CALL spawn_particle

  ; Spawn orbiting planet 3 (red)
  LDI r10, 68      ; x = 128 - 60
  LDI r11, 88      ; y = 128 - 40
  LDI r12, 0xFFFFFFFE ; vx = -2 (two's complement)
  LDI r13, 4       ; vy = 4
  LDI r14, 40      ; mass = 40
  LDI r15, 0xFF0000 ; color = red
  LDI r16, 20      ; trail_len
  CALL spawn_particle

  RET

; ─── SPAWN PARTICLE ─────────────────────────────────────
; Args: r10=x, r11=y, r12=vx, r13=vy, r14=mass, r15=color, r16=trail_len
spawn_particle:
  ; Get current particle_count
  LDI r20, 0x2000
  LOAD r20, r21
  CMPI r21, 8
  BGE r0, sp_ret

  ; Compute particle address: 0x4000 + count * 8
  LDI r22, 0x4000
  LDI r23, 8
  MUL r23, r21
  ADD r22, r23
  ; r22 = particle address

  ; Store particle fields
  STORE r22, r10          ; x
  ADDI r22, 1
  STORE r22, r11          ; y
  ADDI r22, 1
  STORE r22, r12          ; vx
  ADDI r22, 1
  STORE r22, r13          ; vy
  ADDI r22, 1
  STORE r22, r14          ; mass
  ADDI r22, 1
  STORE r22, r15          ; color
  ADDI r22, 1
  STORE r22, r16          ; trail_len
  ADDI r22, 1
  LDI r15, 0
  STORE r22, r15          ; trail_idx

  ; Increment particle_count
  LDI r20, 0x2000
  LOAD r20, r21
  ADDI r21, 1
  STORE r20, r21

sp_ret:
  RET

; ─── MAIN LOOP ───────────────────────────────────────────
main_loop:
  CALL clear_screen
  CALL read_input
  CALL update_physics
  CALL check_collisions
  CALL draw_trails
  CALL draw_particles
  CALL update_trails
  FRAME
  JMP main_loop

; ─── CLEAR SCREEN ───────────────────────────────────────
clear_screen:
  LDI r10, 0
  FILL r10
  RET

; ─── READ INPUT ────────────────────────────────────────
read_input:
  ; Read key bitmask from 0xFFB
  LDI r10, 0xFFB
  LOAD r10, r10

  ; Check Space (bit 4) = spawn random body
  LDI r11, 16
  AND r10, r11
  JZ r0, ri_no_spawn

  ; Spawn random particle at random position with random velocity
  RAND r10
  ANDI r10, 200        ; x position (0-200)
  ADDI r10, 28         ; center around 128
  MOV r11, r10         ; x

  RAND r10
  ANDI r10, 200        ; y position
  ADDI r10, 28
  MOV r12, r11         ; y

  RAND r10
  ANDI r10, 6          ; vx (-3 to 3)
  SUBI r10, 3
  MOV r13, r10         ; vx

  RAND r10
  ANDI r10, 6          ; vy
  SUBI r10, 3
  MOV r14, r10         ; vy

  RAND r10
  ANDI r10, 100
  ADDI r10, 30         ; mass (30-130)
  MOV r15, r10         ; mass

  ; Random bright color
  RAND r10
  ANDI r10, 3          ; color index 0-3
  LDI r11, 0x00FFFF    ; cyan
  CMPI r10, 0
  JZ r0, ri_cyan
  LDI r11, 0x00FF00    ; green
  CMPI r10, 1
  JZ r0, ri_green
  LDI r11, 0xFF00FF    ; magenta
  CMPI r10, 2
  JZ r0, ri_magenta
  LDI r11, 0xFF8800    ; orange
ri_magenta:
ri_green:
ri_cyan:
  MOV r16, r11

  LDI r17, 16          ; trail_len
  CALL spawn_particle

ri_no_spawn:
  RET

; ─── UPDATE PHYSICS ──────────────────────────────────────
update_physics:
  LDI r10, 0x2000
  LOAD r10, r10        ; r10 = particle_count
  JZ r0, up_ret

  ; For each particle i, compute forces from all particles j
  LDI r20, 0           ; i = 0
up_i_loop:
  LDI r21, 0x2000
  LOAD r21, r21        ; r21 = particle_count
  CMP r20, r21
  BGE r0, up_i_done

  ; Get particle i address and load position/velocity/mass
  LDI r22, 0x4000
  LDI r23, 8
  MUL r23, r20
  ADD r22, r23
  ; r22 = particle_i address

  LOAD r22, r10        ; x_i
  MOV r24, r22         ; save addr
  ADDI r22, 1
  LOAD r22, r11        ; y_i
  MOV r25, r22         ; save addr
  ADDI r22, 1
  LOAD r22, r12        ; vx_i
  MOV r26, r22         ; save addr
  ADDI r22, 1
  LOAD r22, r13        ; vy_i
  MOV r27, r22         ; save addr
  ADDI r22, 1
  LOAD r22, r28        ; mass_i

  ; Initialize force accumulator
  LDI r29, 0           ; fx = 0
  LDI r1, 0            ; fy = 0

  ; Loop over all j particles
  LDI r23, 0           ; j = 0
up_j_loop:
  LDI r24, 0x2000
  LOAD r24, r24
  CMP r23, r24
  BGE r0, up_j_done

  CMP r23, r20
  JZ r0, up_j_next     ; Skip self

  ; Get particle j address and load position/mass
  LDI r2, 0x4000
  LDI r3, 8
  MUL r3, r23
  ADD r2, r3
  ; r2 = particle_j address

  LOAD r2, r3          ; x_j
  ADDI r2, 1
  LOAD r2, r4          ; y_j
  ADDI r2, 1
  ADDI r2, 1
  ADDI r2, 1
  LOAD r2, r5          ; mass_j

  ; Compute dx = x_j - x_i, dy = y_j - y_i
  MOV r6, r3
  SUB r6, r10          ; dx = x_j - x_i
  MOV r7, r4
  SUB r7, r11          ; dy = y_j - y_i

  ; Compute dx^2 + dy^2 (as squared distance)
  MOV r8, r6
  MUL r8, r8           ; dx^2
  MOV r9, r7
  MUL r9, r9           ; dy^2
  ADD r8, r9           ; dist_sq = dx^2 + dy^2

  ; Avoid division by zero (min distance squared = 100)
  LDI r9, 100
  CMP r8, r9
  BLT r0, up_j_next    ; Too close, skip

  ; Compute force magnitude: F = G * m_i * m_j / dist_sq
  LDI r9, 0x2001
  LOAD r9, r9          ; G constant
  MUL r9, r28          ; G * m_i
  MUL r9, r5           ; G * m_i * m_j
  DIV r9, r8           ; F = G * m_i * m_j / dist_sq

  ; Compute acceleration components
  ; a_x = F * dx / m_i, a_y = F * dy / m_i
  MOV r8, r6
  MUL r8, r9           ; F * dx
  DIV r8, r28          ; a_x = F * dx / m_i
  SHRI r8, 4           ; Scale down to avoid overflow

  MOV r9, r7
  MUL r9, r9           ; F * dy
  DIV r9, r28          ; a_y = F * dy / m_i
  SHRI r9, 4           ; Scale down

  ; Accumulate forces
  ADD r29, r8          ; fx += a_x
  ADD r1, r9           ; fy += a_y

up_j_next:
  ADDI r23, 1
  JMP up_j_loop
up_j_done:

  ; Update velocities: vx += fx, vy += fy
  LOAD r26, r8         ; vx_i
  ADD r8, r29
  STORE r26, r8

  LOAD r27, r9         ; vy_i
  ADD r9, r1
  STORE r27, r9

  ; Update positions: x += vx, y += vy
  LOAD r24, r8         ; x_i
  ADD r8, r12          ; x += vx
  STORE r24, r8

  LOAD r25, r9         ; y_i
  ADD r9, r13          ; y += vy
  STORE r25, r9

  ADDI r20, 1
  JMP up_i_loop
up_i_done:
up_ret:
  RET

; ─── CHECK COLLISIONS ────────────────────────────────────
check_collisions:
  LDI r10, 0x2000
  LOAD r10, r10        ; particle_count
  JZ r0, cc_ret

  LDI r20, 0           ; i = 0
cc_i_loop:
  LDI r21, 0x2000
  LOAD r21, r21
  CMP r20, r21
  BGE r0, cc_i_done

  LDI r22, 0x4000
  LDI r23, 8
  MUL r23, r20
  ADD r22, r23

  LOAD r22, r10        ; x_i
  ADDI r22, 1
  LOAD r22, r11        ; y_i

  LDI r23, 0           ; j = 0
cc_j_loop:
  LDI r24, 0x2000
  LOAD r24, r24
  CMP r23, r24
  BGE r0, cc_j_done

  CMP r23, r20
  JZ r0, cc_j_next     ; Skip self

  LDI r25, 0x4000
  LDI r26, 8
  MUL r26, r23
  ADD r25, r26

  LOAD r25, r12        ; x_j
  ADDI r25, 1
  LOAD r25, r13        ; y_j

  ; Compute distance squared: (x_j - x_i)^2 + (y_j - y_i)^2
  MOV r14, r12
  SUB r14, r10
  MUL r14, r14         ; dx^2

  MOV r15, r13
  SUB r15, r11
  MUL r15, r15         ; dy^2

  ADD r14, r15         ; dist_sq

  ; Collision threshold = 64 (radius 8 * radius 8)
  LDI r15, 64
  CMP r14, r15
  BGE r0, cc_j_next    ; No collision

  ; Collision! Merge particles into i
  ; Get addresses
  LDI r25, 0x4000
  LDI r26, 8
  MUL r26, r23
  ADD r25, r26

  ; Load particle j properties
  ADDI r25, 2
  LOAD r25, r14        ; vx_j
  ADDI r25, 1
  LOAD r25, r15        ; vy_j
  ADDI r25, 1
  LOAD r25, r16        ; mass_j

  ; Get particle i address back
  LDI r25, 0x4000
  LDI r26, 8
  MUL r26, r20
  ADD r25, r26

  ; Load particle i properties
  LOAD r25, r10        ; x_i
  ADDI r25, 1
  LOAD r25, r11        ; y_i
  ADDI r25, 1
  LOAD r25, r12        ; vx_i
  ADDI r25, 1
  LOAD r25, r13        ; vy_i
  ADDI r25, 1
  LOAD r25, r17        ; mass_i

  ; Compute new mass: m_new = m_i + m_j
  ADD r17, r16

  ; Compute new velocity (conservation of momentum):
  ; v_new = (m_i * v_i + m_j * v_j) / m_new
  MOV r18, r17
  MUL r18, r12         ; m_i * vx_i
  MOV r19, r16
  MUL r19, r14         ; m_j * vx_j
  ADD r18, r19
  DIV r18, r17         ; vx_new

  MOV r19, r17
  MUL r19, r13         ; m_i * vy_i
  MOV r2, r16
  MUL r2, r15          ; m_j * vy_j
  ADD r19, r2
  DIV r19, r17         ; vy_new

  ; Store updated particle i
  STORE r25, r10        ; x_i
  ADDI r25, 1
  STORE r25, r11        ; y_i
  ADDI r25, 1
  STORE r25, r18        ; vx_i
  ADDI r25, 1
  STORE r25, r19        ; vy_i
  ADDI r25, 1
  STORE r25, r17        ; mass_i

  ; Remove particle j by moving last particle to j's position
  LDI r20, 0x2000
  LOAD r20, r3          ; particle_count
  SUBI r3, 1
  STORE r20, r3          ; decrement count

  LDI r20, 0x2000
  LOAD r20, r3          ; new count
  CMP r23, r3
  BGE r0, cc_j_next     ; j is already the last particle

  ; Copy last particle (at index count-1) to position j
  MOV r20, r3
  LDI r21, 0x4000
  LDI r22, 8
  MUL r22, r20
  ADD r21, r22          ; source addr

  LDI r22, 0x4000
  LDI r23, 8
  MUL r23, r23
  ADD r22, r23          ; dest addr

  ; Copy 8 words
  LDI r24, 0
cc_copy_loop:
  CMPI r24, 8
  BGE r0, cc_copy_done
  LOAD r21, r25
  STORE r22, r25
  ADDI r21, 1
  ADDI r22, 1
  ADDI r24, 1
  JMP cc_copy_loop
cc_copy_done:

  ; Decrement i since we removed a particle
  SUBI r20, 1

cc_j_next:
  ADDI r23, 1
  JMP cc_j_loop
cc_j_done:
  ADDI r20, 1
  JMP cc_i_loop
cc_i_done:
cc_ret:
  RET

; ─── DRAW TRAILS ────────────────────────────────────────
draw_trails:
  LDI r10, 0x2000
  LOAD r10, r10        ; particle_count
  JZ r0, dt_ret

  LDI r20, 0           ; particle index
dt_loop:
  CMP r20, r10
  BGE r0, dt_done

  ; Get particle address
  LDI r22, 0x4000
  LDI r23, 8
  MUL r23, r20
  ADD r22, r23

  ; Get color and trail_len
  ADDI r22, 5
  LOAD r22, r21        ; color
  ADDI r22, 1
  LOAD r22, r23        ; trail_len
  ADDI r22, 1
  LOAD r22, r24        ; trail_idx

  JZ r23, dt_next      ; trail_len = 0, skip

  ; Draw trail points
  LDI r25, 0           ; point index
dt_point_loop:
  CMP r25, r23
  BGE r0, dt_point_done

  ; Compute trail buffer index: (trail_idx - point - 1 + trail_len) % trail_len
  MOV r26, r24
  SUB r26, r25
  SUBI r26, 1
  ADD r26, r23
  MOD r26, r23

  ; Trail address: 0x3000 + particle_index * 32 + buffer_index * 2
  LDI r27, 0x3000
  LDI r28, 32
  MUL r28, r20
  ADD r27, r28
  LDI r28, 2
  MUL r28, r26
  ADD r27, r28

  ; Load x, y
  LOAD r27, r28        ; x
  ADDI r27, 1
  LOAD r27, r29        ; y

  ; Draw point (darker version of color)
  SHRI r21, 2
  PSET r28, r29, r21

  ADDI r25, 1
  JMP dt_point_loop
dt_point_done:

dt_next:
  ADDI r20, 1
  JMP dt_loop
dt_done:
dt_ret:
  RET

; ─── DRAW PARTICLES ─────────────────────────────────────
draw_particles:
  LDI r10, 0x2000
  LOAD r10, r10        ; particle_count
  JZ r0, dp_ret

  LDI r20, 0
dp_loop:
  CMP r20, r10
  BGE r0, dp_done

  LDI r22, 0x4000
  LDI r23, 8
  MUL r23, r20
  ADD r22, r23

  LOAD r22, r10        ; x
  ADDI r22, 1
  LOAD r22, r11        ; y
  ADDI r22, 1
  ADDI r22, 1
  ADDI r22, 1
  ADDI r22, 1
  LOAD r22, r12        ; color

  PSET r10, r11, r12

  ADDI r20, 1
  JMP dp_loop

dp_done:
dp_ret:
  RET

; ─── UPDATE TRAILS ──────────────────────────────────────
update_trails:
  LDI r10, 0x2000
  LOAD r10, r10        ; particle_count
  JZ r0, ut_ret

  LDI r20, 0
ut_loop:
  CMP r20, r10
  BGE r0, ut_done

  LDI r22, 0x4000
  LDI r23, 8
  MUL r23, r20
  ADD r22, r23

  LOAD r22, r10        ; x
  ADDI r22, 1
  LOAD r22, r11        ; y
  ADDI r22, 1
  ADDI r22, 1
  ADDI r22, 1
  ADDI r22, 1
  LOAD r22, r12        ; mass (use for size)
  ADDI r22, 1
  LOAD r22, r13        ; color
  ADDI r22, 1
  LOAD r22, r14        ; trail_len
  ADDI r22, 1
  LOAD r22, r15        ; trail_idx

  JZ r14, ut_next      ; trail_len = 0, skip

  ; Compute trail buffer address
  LDI r16, 0x3000
  LDI r17, 32
  MUL r17, r20
  ADD r16, r17
  LDI r17, 2
  MUL r17, r15
  ADD r16, r17

  ; Store x, y
  STORE r16, r10
  ADDI r16, 1
  STORE r16, r11

  ; Increment trail_idx (modulo trail_len)
  ADDI r15, 1
  MOD r15, r14
  ; Store updated trail_idx
  LDI r22, 0x4000
  LDI r23, 8
  MUL r23, r20
  ADD r22, r23
  ADDI r22, 6
  ADDI r22, 1
  STORE r22, r15

ut_next:
  ADDI r20, 1
  JMP ut_loop
ut_done:
ut_ret:
  RET

HALT