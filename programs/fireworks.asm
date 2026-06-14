; fireworks.asm -- Multi-burst Firework Display
;
; Demonstrates:
;   1. Particle emitter with velocity and lifetime
;   2. Gravity and decay simulation using integer math
;   3. Multi-emitter firework display
;   4. Color palette cycling per burst (systematic color rotation)
;   5. Launch trails using LINE opcode (Bresenham streaks)
;
; Shells auto-launch from random positions along the ground line.
; Each shell rises under gravity with a LINE trail, then explodes
; into colored particles that spread, fall, and fade over their lifetime.
; New shells launch at random intervals from different positions.
; Each burst cycles through the palette (red, green, blue, gold...).
;
; Memory layout:
;   0x2000..0x25FF: particle pool (256 x 6 words)
;     Per particle: x, y, vx, vy, color, life
;     life = 0 means inactive slot
;     life > 900 means shell (rising, explodes at apex)
;   0x2D00: frame_counter (u32)
;   0x2D01: launch_timer (u32, countdown to next shell)
;   0x2D02: burst_color_idx (u32, cycles 0..7 for palette rotation)
;   0x2D04..0x2D0B: color palette (8 colors for explosions)
;
; No user interaction required -- fully automatic display.
;
; Gravity: vy += 1 each frame (integer addition)
; Decay: life decremented each frame; color channels shifted
;   right by ((60 - life) >> 3) for smooth fade
; Lifetime: explosion particles live 30-59 frames, shells 950
;
; Controls: None (automatic)
; Uses: FILL, FRAME, PSET, LINE, RAND, SCROLL, SHRI, SHLI, ANDI, ADDI, SUBI

; ===== Constants =====
LDI r7, 1
LDI r20, 6              ; particle stride (words per particle)
LDI r21, 256            ; max particles
LDI r22, 0x2000         ; particle pool base
LDI r30, 0xFF00         ; stack pointer

; ===== Build Color Palette (8 colors at 0x2D04) =====
LDI r14, 0x2D04
LDI r15, 0xFF2222       ; 0 - red
STORE r14, r15
ADD r14, r7
LDI r15, 0x22FF22       ; 1 - green
STORE r14, r15
ADD r14, r7
LDI r15, 0x4488FF       ; 2 - blue
STORE r14, r15
ADD r14, r7
LDI r15, 0xFFDD00       ; 3 - gold
STORE r14, r15
ADD r14, r7
LDI r15, 0xFF44FF       ; 4 - magenta
STORE r14, r15
ADD r14, r7
LDI r15, 0x44FFFF       ; 5 - cyan
STORE r14, r15
ADD r14, r7
LDI r15, 0xFF8800       ; 6 - orange
STORE r14, r15
ADD r14, r7
LDI r15, 0xFFFFFF       ; 7 - white
STORE r14, r15

; ===== Initialize State =====
LDI r17, 0x2D00
LDI r18, 0
STORE r17, r18          ; frame_counter = 0
ADD r17, r7
LDI r18, 3
STORE r17, r18          ; launch_timer = 3 (first shell soon)
ADD r17, r7
LDI r18, 0
STORE r17, r18          ; burst_color_idx = 0

; ===== Main Loop =====
main_loop:
  ; Increment frame counter
  LDI r17, 0x2D00
  LOAD r18, r17
  ADD r18, r7
  STORE r17, r18

  ; Decrement launch timer
  LDI r17, 0x2D01
  LOAD r18, r17
  LDI r19, 0
  CMP r18, r19
  JZ r0, timer_expired
  SUBI r18, 1
  STORE r17, r18
  JMP do_launch_check2

timer_expired:
  ; Launch a new shell
  CALL launch_shell

  ; Reset timer: 25 + RAND & 31 = 25..56 frames
  RAND r18
  ANDI r18, 31
  ADDI r18, 25
  LDI r17, 0x2D01
  STORE r17, r18

do_launch_check2:
  ; Occasionally launch a second shell for multi-emitter effect
  LDI r17, 0x2D00
  LOAD r18, r17
  ANDI r18, 31           ; every 32 frames
  JNZ r18, do_update

  RAND r18
  ANDI r18, 1            ; 50% chance
  JZ r18, do_update

  CALL launch_shell

do_update:
  ; Fade previous frame (scroll up 1 for trail effect)
  LDI r18, 1
  SCROLL r18

  ; Scan all 256 particle slots
  LDI r13, 0             ; index

update_loop:
  CMP r13, r21
  BGE r0, update_done

  ; Compute address of particle[index]
  MOV r14, r22
  MOV r15, r13
  MUL r15, r20
  ADD r14, r15

  ; Check life (offset +5)
  LDI r16, 5
  ADD r16, r14
  LOAD r6, r16           ; r6 = life

  ; Skip if inactive (life == 0)
  LDI r17, 0
  CMP r6, r17
  JZ r0, skip_particle

  ; Load particle data
  LOAD r1, r14           ; x
  LDI r16, 1
  ADD r14, r16
  LOAD r2, r14           ; y
  ADD r14, r7
  LOAD r3, r14           ; vx
  ADD r14, r7
  LOAD r4, r14           ; vy
  ADD r14, r7
  LOAD r5, r14           ; color
  ; r6 already has life

  ; Is this a shell? (life > 900)
  LDI r17, 900
  CMP r6, r17
  BLT r0, not_shell

  ; === Shell physics ===
  ; Save old position for LINE trail
  MOV r10, r1            ; old_x
  MOV r11, r2            ; old_y

  ; Apply gravity
  ADDI r4, 1             ; vy += 1 (gravity pulls down)
  ADD r1, r3             ; x += vx
  ADD r2, r4             ; y += vy
  SUBI r6, 1             ; decrement life

  ; Check if apex reached (vy >= 0, i.e. stopped going up)
  LDI r17, 0
  CMP r4, r17
  BLT r0, shell_alive    ; still going up (vy < 0)

  ; Apex reached -- EXPLODE this shell!
  MOV r28, r13           ; save current index for later
  CALL explode_shell
  MOV r13, r28           ; restore current index
  JMP skip_particle

shell_alive:
  ; Draw launch trail using LINE opcode (from old pos to new pos)
  ; Trail color: warm yellow-orange based on velocity
  LDI r8, 0xFFCC44
  LINE r10, r11, r1, r2, r8

  ; Store updated shell
  MOV r14, r22
  MOV r15, r13
  MUL r15, r20
  ADD r14, r15
  STORE r14, r1          ; x
  LDI r16, 1
  ADD r14, r16
  STORE r14, r2          ; y
  ADD r14, r7
  STORE r14, r3          ; vx
  ADD r14, r7
  STORE r14, r4          ; vy
  ADD r14, r7
  ADD r14, r7            ; skip color (unchanged)
  STORE r14, r6          ; life

  ; Draw shell as bright 2x2 white dot
  LDI r8, 0xFFFFCC
  PSET r1, r2, r8
  MOV r18, r1
  ADD r18, r7
  PSET r18, r2, r8
  MOV r18, r2
  ADD r18, r7
  PSET r1, r18, r8
  MOV r18, r1
  ADD r18, r7
  MOV r19, r2
  ADD r19, r7
  PSET r18, r19, r8
  JMP skip_particle

not_shell:
  ; === Regular particle physics ===
  ; Apply gravity
  ADDI r4, 1             ; vy += 1 (gravity)
  ADD r1, r3             ; x += vx
  ADD r2, r4             ; y += vy
  SUBI r6, 1             ; decrement life

  ; Kill if off-screen (y > 254)
  LDI r17, 254
  CMP r2, r17
  BGE r0, kill_particle

  ; Kill if off-screen left (x < 0 as signed)
  LDI r17, 0
  CMP r1, r17
  BLT r0, kill_particle

  ; Kill if off-screen right (x > 254)
  LDI r17, 254
  CMP r1, r17
  BGE r0, kill_particle

  ; Kill if life ran out
  LDI r17, 0
  CMP r6, r17
  JZ r0, kill_particle

  ; Store updated particle
  MOV r14, r22
  MOV r15, r13
  MUL r15, r20
  ADD r14, r15
  STORE r14, r1          ; x
  LDI r16, 1
  ADD r14, r16
  STORE r14, r2          ; y
  ADD r14, r7
  STORE r14, r3          ; vx
  ADD r14, r7
  STORE r14, r4          ; vy
  ADD r14, r7
  ADD r14, r7            ; skip color
  STORE r14, r6          ; life

  ; Compute faded color for drawing
  ; If life >= 45, no fade (full brightness)
  LDI r17, 45
  CMP r6, r17
  BGE r0, draw_full

  ; Fade shift = (60 - life) >> 3, range 0..7
  LDI r17, 60
  SUB r17, r6
  SHRI r17, 3            ; fade_shift 0..7

  ; Fade red channel
  MOV r18, r5
  SHRI r18, 16
  ANDI r18, 0xFF
  SHR r18, r17
  SHLI r18, 16
  MOV r9, r18

  ; Fade green channel
  MOV r18, r5
  SHRI r18, 8
  ANDI r18, 0xFF
  SHR r18, r17
  SHLI r18, 8
  OR r9, r18

  ; Fade blue channel
  MOV r18, r5
  ANDI r18, 0xFF
  SHR r18, r17
  OR r9, r18

  ; Skip if fully faded to black
  LDI r18, 0
  CMP r9, r18
  JZ r0, skip_particle

  PSET r1, r2, r9
  JMP skip_particle

draw_full:
  PSET r1, r2, r5
  JMP skip_particle

kill_particle:
  MOV r14, r22
  MOV r15, r13
  MUL r15, r20
  ADD r14, r15
  LDI r16, 5
  ADD r14, r16
  LDI r18, 0
  STORE r14, r18         ; life = 0 (kill particle)

skip_particle:
  ADD r13, r7
  JMP update_loop

update_done:
  ; Draw ground line at y=252 (dark gray)
  LDI r18, 0x222222
  LDI r2, 252
  LDI r1, 0
ground_loop:
  PSET r1, r2, r18
  ADD r1, r7
  LDI r17, 256
  CMP r1, r17
  BLT r0, ground_loop

  FRAME
  JMP main_loop

; ===== launch_shell =====
; Finds a free slot and spawns a rising shell
; Increments burst_color_idx for palette cycling
; Uses r13, r14, r15, r16, r17, r18 (clobbers freely)
launch_shell:
  PUSH r31

  ; Find free slot: scan for life == 0
  LDI r13, 0
find_free:
  CMP r13, r21
  BGE r0, no_free_slot
  MOV r14, r22
  MOV r15, r13
  MUL r15, r20
  ADD r14, r15
  LDI r16, 5
  ADD r16, r14
  LOAD r18, r16
  LDI r19, 0
  CMP r18, r19
  JZ r0, found_slot
  ADD r13, r7
  JMP find_free

found_slot:
  ; r14 = address of particle[index] start
  ; (recompute since we loaded life from offset +5)
  MOV r14, r22
  MOV r15, r13
  MUL r15, r20
  ADD r14, r15

  ; x = random launch position (32..223)
  RAND r18
  ANDI r18, 0xC0         ; 0, 64, 128, 192
  ADDI r18, 32           ; 32, 96, 160, 224
  STORE r14, r18         ; x
  ADD r14, r7

  ; y = 250 (launch from ground)
  LDI r18, 250
  STORE r14, r18
  ADD r14, r7

  ; vx = random(-1..1)
  RAND r18
  ANDI r18, 3
  SUBI r18, 1
  STORE r14, r18         ; vx
  ADD r14, r7

  ; vy = -(4 + RAND & 3) = -4..-7 (upward)
  RAND r18
  ANDI r18, 3
  ADDI r18, 4
  NEG r18
  STORE r14, r18         ; vy
  ADD r14, r7

  ; color = get cycling burst color for this launch
  ; Read burst_color_idx, use it to index palette
  LDI r17, 0x2D02
  LOAD r18, r17          ; r18 = burst_color_idx (0..7)
  ANDI r18, 7            ; clamp to 0..7
  LDI r17, 0x2D04
  ADD r17, r18
  LOAD r18, r17          ; r18 = palette[burst_color_idx]
  STORE r14, r18         ; store burst color in particle
  ADD r14, r7

  ; life = 950 (shell marker, > 900)
  LDI r18, 950
  STORE r14, r18

  ; Increment burst_color_idx for next launch (palette cycling)
  LDI r17, 0x2D02
  LOAD r18, r17
  ADDI r18, 1
  ANDI r18, 7            ; wrap to 0..7
  STORE r17, r18

no_free_slot:
  POP r31
  RET

; ===== explode_shell =====
; Shell at position (r11=x, r12=y), slot index in r28
; Kills the shell and spawns 16 explosion particles
; Uses the shell's color field (set from cycling palette) for the burst
; Preserves r28
explode_shell:
  PUSH r31

  ; Kill the shell (life = 0)
  MOV r14, r22
  MOV r15, r28
  MUL r15, r20
  ADD r14, r15
  LDI r16, 5
  ADD r14, r16
  LDI r18, 0
  STORE r14, r18

  ; Read the shell's color (from cycling palette)
  MOV r14, r22
  MOV r15, r28
  MUL r15, r20
  ADD r14, r15
  LDI r16, 4
  ADD r14, r16
  LOAD r9, r14           ; r9 = shell color = cycling palette color

  ; Draw a bright flash at explosion point (3x3 white)
  LDI r8, 0xFFFFFF
  PSET r11, r12, r8
  MOV r18, r11
  ADD r18, r7
  PSET r18, r12, r8
  MOV r18, r11
  SUBI r18, 1
  PSET r18, r12, r8
  MOV r18, r12
  ADD r18, r7
  PSET r11, r18, r8
  MOV r18, r12
  SUBI r18, 1
  PSET r11, r18, r8

  ; Spawn 16 explosion particles
  LDI r10, 16

spawn_loop:
  ; Find free slot
  LDI r13, 0
spawn_find:
  CMP r13, r21
  BGE r0, spawn_done
  MOV r14, r22
  MOV r15, r13
  MUL r15, r20
  ADD r14, r15
  LDI r16, 5
  ADD r16, r14
  LOAD r18, r16
  LDI r19, 0
  CMP r18, r19
  JZ r0, spawn_slot
  ADD r13, r7
  JMP spawn_find

spawn_slot:
  ; Recompute start address
  MOV r14, r22
  MOV r15, r13
  MUL r15, r20
  ADD r14, r15

  ; x = shell_x + random(-4..3)
  RAND r18
  ANDI r18, 7
  SUBI r18, 4
  ADD r18, r11
  STORE r14, r18
  ADD r14, r7

  ; y = shell_y + random(-4..3)
  RAND r18
  ANDI r18, 7
  SUBI r18, 4
  ADD r18, r12
  STORE r14, r18
  ADD r14, r7

  ; vx = random(-4..3)
  RAND r18
  ANDI r18, 7
  SUBI r18, 4
  STORE r14, r18
  ADD r14, r7

  ; vy = random(-6..-1) (upward initial velocity)
  RAND r18
  ANDI r18, 7
  ADDI r18, 1
  NEG r18
  STORE r14, r18
  ADD r14, r7

  ; color = cycling burst color with slight random variation
  RAND r18
  ANDI r18, 0x1F1F1F
  OR r18, r9
  STORE r14, r18
  ADD r14, r7

  ; life = 30 + random(30) = 30..59 frames
  RAND r18
  ANDI r18, 31
  ADDI r18, 30
  STORE r14, r18

  ; Loop counter
  SUBI r10, 1
  JNZ r10, spawn_loop

spawn_done:
  POP r31
  RET
