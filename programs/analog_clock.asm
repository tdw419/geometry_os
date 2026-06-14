; analog_clock.asm -- Analog Clock App for Geometry OS
;
; Shows a circular analog clock with second, minute, and hour hands
; using LINE and CIRCLE opcodes. TICKS-based time progression.
;
; Sine table: triangle wave -128..+128 at 0x2000 (256 values)
;
; RAM Layout:
;   0x2000-0x20FF   Sine table (256 words, -128..+128)
;   0x2100          Colors: 0=face_color 1=bg 2=sec_color 3=min_color 4=hr_color
;
; Screen:
;   Clock center: (128, 128), outer radius 96
;   Second hand: red, length 80
;   Minute hand: cyan, length 70
;   Hour hand:   white, length 52

#define SINE_BASE  0x2000
#define COLORS     0x2100
#define TICKS      0xFFE
#define CENTER_X   128
#define CENTER_Y   128
#define FACE_R     96
#define SEC_LEN    80
#define MIN_LEN    70
#define HOUR_LEN   52

; ── BOOT ──────────────────────────────────────────────────
boot:
  LDI r30, 0xFF00       ; initialize stack pointer
  PUSH r31
  CALL build_sine
  POP r31
  PUSH r31
  CALL init_clock
  POP r31
  JMP main_loop

; ── BUILD SINE TABLE (triangle wave -128..+128) ──────────
; Range: angle 0..255 produces sine -128..+128
build_sine:
  LDI r20, SINE_BASE
  LDI r10, 0
sin_lp:
  CMPI r10, 64
  BLT r0, sin_rise     ; 0-63: ramp 0 to +128
  CMPI r10, 192
  BLT r0, sin_fall     ; 64-191: ramp +128 down to -128
  ; 192-255: ramp from -128 toward 0
  LDI r19, 256
  SUB r19, r10         ; r19 = 256 - angle (64..1)
  SHLI r19, 1          ; r19 = 128..2
  NEG r19              ; r19 = -128..-2
  JMP sin_st
sin_fall:
  LDI r19, 128
  SUB r19, r10         ; r19 = 64..-63
  SHLI r19, 1          ; r19 = 128..-126
  JMP sin_st
sin_rise:
  MOV r19, r10
  SHLI r19, 1          ; r19 = 0..126
sin_st:
  MOV r21, r20
  ADD r21, r10
  STORE r21, r19
  ADDI r10, 1
  CMPI r10, 256
  BLT r0, sin_lp
  RET

; ── INIT CLOCK ────────────────────────────────────────────
init_clock:
  LDI r20, COLORS
  LDI r1, 0x1A1A3A      ; face_color -- dark purple
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 0x0A0A1A      ; bg -- dark blue
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 0xFF2222      ; sec_color -- red
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 0x00FFCC      ; min_color -- cyan
  STORE r20, r1
  ADDI r20, 1
  LDI r1, 0xCCCCFF      ; hr_color -- light grey-blue
  STORE r20, r1
  RET

; ── COMPUTE HAND ENDPOINT ────────────────────────────────
; Input:  r10 = angle (0-255), r11 = hand_len
; Output: r12 = x, r13 = y
; Clobbers: r14, r15
compute_hand:
  ; cos_val = sine[(angle + 64) & 0xFF]
  MOV r14, r10
  ADDI r14, 64
  ANDI r14, 0xFF
  LDI r15, SINE_BASE
  ADD r15, r14
  LOAD r14, r15         ; r14 = cos_val (-128..+128)

  ; dx = (cos_val * hand_len) / 128 (signed)
  MUL r14, r11
  SARI r14, 7           ; r14 = dx
  LDI r12, CENTER_X
  ADD r12, r14          ; r12 = x

  ; sin_val = sine[angle]
  LDI r15, SINE_BASE
  ADD r15, r10
  LOAD r14, r15         ; r14 = sin_val (-128..+128)

  ; dy = (sin_val * hand_len) / 128 (signed)
  MUL r14, r11
  SARI r14, 7           ; r14 = dy
  LDI r13, CENTER_Y
  ADD r13, r14          ; r13 = y
  RET

; ── DRAW A SINGLE HOUR MARKER ────────────────────────────
; Draws a short radial line at angle r10 on the clock face
; using color in r20. Uses sine table at SINE_BASE.
; Input: r10 = angle, r20 = color
; Clobbers: r14-r19
draw_marker:
  ; Compute outer point (at FACE_R)
  MOV r14, r10
  ADDI r14, 64
  ANDI r14, 0xFF
  LDI r15, SINE_BASE
  ADD r15, r14
  LOAD r14, r15         ; r14 = cos_val
  LDI r16, FACE_R
  MUL r14, r16
  SARI r14, 7
  LDI r17, CENTER_X
  ADD r17, r14          ; r17 = outer_x

  LDI r15, SINE_BASE
  ADD r15, r10
  LOAD r14, r15         ; r14 = sin_val
  MUL r14, r16
  SARI r14, 7
  LDI r18, CENTER_Y
  ADD r18, r14          ; r18 = outer_y

  ; Compute inner point (at FACE_R - 12)
  MOV r14, r10
  ADDI r14, 64
  ANDI r14, 0xFF
  LDI r15, SINE_BASE
  ADD r15, r14
  LOAD r14, r15         ; r14 = cos_val
  LDI r16, FACE_R
  SUBI r16, 12          ; r16 = inner radius
  MUL r14, r16
  SARI r14, 7
  LDI r19, CENTER_X
  ADD r19, r14          ; r19 = inner_x

  LDI r15, SINE_BASE
  ADD r15, r10
  LOAD r14, r15         ; r14 = sin_val
  MUL r14, r16
  SARI r14, 7
  LDI r16, CENTER_Y
  ADD r16, r14          ; r16 = inner_y

  ; Draw LINE from (inner_x, inner_y) to (outer_x, outer_y)
  LINE r19, r16, r17, r18, r20
  RET

; ── DRAW ALL 12 MARKERS ─────────────────────────────────
draw_markers:
  PUSH r31
  LDI r10, 0            ; marker counter
  LDI r20, COLORS
  LOAD r20, r20         ; marker color = face_color
dm_lp:
  CMPI r10, 12
  BGE r0, dm_done
  ; Compute angle = marker * 21 (12 * 21 = 252, close to 256)
  MOV r11, r10
  LDI r12, 21
  MUL r11, r12
  ANDI r11, 0xFF        ; r11 = angle (0..255)
  MOV r10, r11          ; save angle in r10 for draw_marker
  PUSH r10
  PUSH r20
  CALL draw_marker
  POP r20
  POP r10
  ADDI r10, 1
  JMP dm_lp
dm_done:
  POP r31
  RET

; ── MAIN LOOP ────────────────────────────────────────────
main_loop:
  ; Background fill
  LDI r20, COLORS
  ADDI r20, 1
  LOAD r20, r20         ; r20 = bg color
  FILL r20

  ; Draw clock face circle outline
  LDI r20, COLORS
  LOAD r20, r20         ; r20 = face_color
  LDI r1, CENTER_X
  LDI r2, CENTER_Y
  LDI r3, FACE_R
  CIRCLE r1, r2, r3, r20

  ; Draw 12 hour markers
  PUSH r31
  CALL draw_markers
  POP r31

  ; Read TICKS counter
  LDI r1, TICKS
  LOAD r8, r1           ; r8 = TICKS

  ; Hour hand: angle = (TICKS / 3072) & 0xFF
  ; One full rotation per ~786K TICKS (~3.6 hours at 60fps)
  LDI r10, 3072
  MOV r9, r8
  DIV r9, r10           ; r9 = TICKS / 3072
  ANDI r9, 0xFF         ; r9 = hour_angle
  PUSH r31
  MOV r10, r9
  LDI r11, HOUR_LEN
  CALL compute_hand     ; r12=x, r13=y
  LDI r20, COLORS
  ADDI r20, 4
  LOAD r20, r20         ; hr_color
  LDI r0, CENTER_X
  LDI r1, CENTER_Y
  LINE r0, r1, r12, r13, r20
  POP r31

  ; Minute hand: angle = (TICKS / 256) & 0xFF
  ; One full rotation per 65536 TICKS (~18 min at 60fps)
  LDI r10, 256
  MOV r9, r8
  DIV r9, r10           ; r9 = minute_angle
  ANDI r9, 0xFF
  PUSH r31
  MOV r10, r9
  LDI r11, MIN_LEN
  CALL compute_hand
  LDI r20, COLORS
  ADDI r20, 3
  LOAD r20, r20         ; min_color
  LDI r0, CENTER_X
  LDI r1, CENTER_Y
  LINE r0, r1, r12, r13, r20
  POP r31

  ; Second hand: angle = TICKS & 0xFF
  ; One full rotation per 256 TICKS (~4.3 sec at 60fps)
  MOV r9, r8
  ANDI r9, 0xFF         ; r9 = second_angle
  PUSH r31
  MOV r10, r9
  LDI r11, SEC_LEN
  CALL compute_hand
  LDI r20, COLORS
  ADDI r20, 2
  LOAD r20, r20         ; sec_color
  LDI r0, CENTER_X
  LDI r1, CENTER_Y
  LINE r0, r1, r12, r13, r20
  POP r31

  ; Center dot
  LDI r20, COLORS
  ADDI r20, 4
  LOAD r20, r20         ; hr_color
  LDI r0, CENTER_X
  LDI r1, CENTER_Y
  PSET r0, r1, r20

  FRAME
  JMP main_loop
