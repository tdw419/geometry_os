; DESCRIPTION: The GeOS assembly code implements a live register dashboard that displays the values of registers `r5` to `r16` as 4-digit decimal numbers on a canvas grid. Each frame, `r5` increments, and subsequent registers derive from `r5` via various arithmetic operations. The register values are then converted to ASCII digits and written to specific canvas buffer addresses for display.

; register_dashboard.asm
; Phase 50: Live Register Dashboard
;
; The canvas grid shows live register values as 4-digit decimals.
; r5 counts up each frame. r15-r16 derive from r5 via arithmetic.
; 8 registers per row, 4 digits each, 2 rows = 16 registers.
; The grid IS the debug view -- no separate inspector.
;
; Layout (canvas buffer indices, addresses = 0x8000 + index):
;   Row 0: r5@0  r15@4  r3@8  r4@12  r6@16  r0@20  r2@24  r1@28
;   Row 1: r9@32 r11@36 r8@40 r7@44 r13@48 r14@52 r12@56 r16@60
;
; Register computations (from r5 = frame counter):
;   r15  = r5 * 2        (double)
;   r3  = r5 * 3        (triple)
;   r4  = r5 * 4        (quadruple)
;   r6  = r5 & 255      (low byte)
;   r0  = r5 * r5       (square)
;   r2  = r5 XOR 0xAAAA (pseudo-random)
;   r1  = r5 << 4       (shifted)
;   r9  = -r5           (negated)
;   r11 = r5 % 17       (modular)
;   r8 = r6 + r0       (sum)
;   r7 = r0 >> 8       (upper square)
;   r13 = r5 | 0x0F0F   (bitmask)
;   r14 = r2 & r1       (combination)
;   r12 = r5 + r9       (zero: r5 + NEG(r5))
;   r16 = r1 - r5       (r5 * 15)

  LDI r30, 0xFF00      ; Stack pointer for CALL/RET
  LDI r20, 10          ; Divisor constant
  LDI r21, 48          ; ASCII '0'
  LDI r22, 1           ; Increment constant

main_loop:
  ; === Update register values ===
  ADD r5, r22           ; r5 = frame counter (1, 2, 3, ...)

  MOV r15, r5            ; r15 = r5 * 2
  ADD r15, r5

  MOV r3, r15            ; r3 = r5 * 3
  ADD r3, r5

  MOV r4, r15            ; r4 = r5 * 4
  ADD r4, r15

  MOV r6, r5            ; r6 = r5 & 0xFF (low byte)
  LDI r23, 255
  AND r6, r23

  MOV r0, r5            ; r0 = r5 * r5 (square)
  MUL r0, r5

  MOV r2, r5            ; r2 = r5 XOR 0xAAAA
  LDI r23, 43690
  XOR r2, r23

  MOV r1, r5            ; r1 = r5 << 4
  LDI r23, 4
  SHL r1, r23

  MOV r9, r5            ; r9 = -r5 (negated)
  NEG r9

  MOV r11, r5           ; r11 = r5 % 17
  LDI r23, 17
  MOD r11, r23

  MOV r8, r6           ; r8 = r6 + r0
  ADD r8, r0

  MOV r7, r0           ; r7 = r0 >> 8
  LDI r23, 8
  SHR r7, r23

  MOV r13, r5           ; r13 = r5 | 0x0F0F
  LDI r23, 3855
  OR r13, r23

  MOV r14, r2           ; r14 = r2 & r1
  AND r14, r1

  MOV r12, r5           ; r12 = r5 + r9 = 0
  ADD r12, r9

  MOV r16, r1           ; r16 = r1 - r5 = r5*15
  SUB r16, r5

  ; === Display registers to canvas ===
  ; Row 0 (canvas indices 0-31)
  LDI r25, 0x8000
  MOV r26, r5
  CALL write_digits

  LDI r25, 0x8004
  MOV r26, r15
  CALL write_digits

  LDI r25, 0x8008
  MOV r26, r3
  CALL write_digits

  LDI r25, 0x800C
  MOV r26, r4
  CALL write_digits

  LDI r25, 0x8010
  MOV r26, r6
  CALL write_digits

  LDI r25, 0x8014
  MOV r26, r0
  CALL write_digits

  LDI r25, 0x8018
  MOV r26, r2
  CALL write_digits

  LDI r25, 0x801C
  MOV r26, r1
  CALL write_digits

  ; Row 1 (canvas indices 32-63)
  LDI r25, 0x8020
  MOV r26, r9
  CALL write_digits

  LDI r25, 0x8024
  MOV r26, r11
  CALL write_digits

  LDI r25, 0x8028
  MOV r26, r8
  CALL write_digits

  LDI r25, 0x802C
  MOV r26, r7
  CALL write_digits

  LDI r25, 0x8030
  MOV r26, r13
  CALL write_digits

  LDI r25, 0x8034
  MOV r26, r14
  CALL write_digits

  LDI r25, 0x8038
  MOV r26, r12
  CALL write_digits

  LDI r25, 0x803C
  MOV r26, r16
  CALL write_digits

  FRAME
  JMP main_loop

; === Subroutine: write 4 decimal digits of r26 to canvas at r25 ===
; Preserves r25, r26. Uses r27, r28, r29 (pushed/popped).
write_digits:
  PUSH r27
  PUSH r28
  PUSH r29

  ; Ones: (r26 % 10) + '0' -> [r25 + 3]
  MOV r27, r26
  MOD r27, r20
  ADD r27, r21
  LDI r28, 3
  MOV r29, r25
  ADD r29, r28
  STORE r29, r27

  ; Tens: ((r26 / 10) % 10) + '0' -> [r25 + 2]
  MOV r27, r26
  DIV r27, r20
  MOD r27, r20
  ADD r27, r21
  LDI r28, 2
  MOV r29, r25
  ADD r29, r28
  STORE r29, r27

  ; Hundreds: ((r26 / 100) % 10) + '0' -> [r25 + 1]
  MOV r27, r26
  LDI r28, 100
  DIV r27, r28
  MOD r27, r20
  ADD r27, r21
  LDI r28, 1
  MOV r29, r25
  ADD r29, r28
  STORE r29, r27

  ; Thousands: ((r26 / 1000) % 10) + '0' -> [r25]
  MOV r27, r26
  LDI r28, 1000
  DIV r27, r28
  MOD r27, r20
  ADD r27, r21
  STORE r25, r27

  POP r29
  POP r28
  POP r27
  RET
