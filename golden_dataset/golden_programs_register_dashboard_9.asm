; DESCRIPTION: The GeOS assembly code implements a live register dashboard that displays the values of registers `r2` to `r16` as 4-digit decimal numbers on a canvas grid. Each frame, `r2` increments, and subsequent registers derive from `r2` via various arithmetic operations. The register values are then converted to ASCII digits and written to specific canvas buffer addresses for display.

; register_dashboard.asm
; Phase 50: Live Register Dashboard
;
; The canvas grid shows live register values as 4-digit decimals.
; r2 counts up each frame. r5-r16 derive from r2 via arithmetic.
; 8 registers per row, 4 digits each, 2 rows = 16 registers.
; The grid IS the debug view -- no separate inspector.
;
; Layout (canvas buffer indices, addresses = 0x8000 + index):
;   Row 0: r2@0  r5@4  r0@8  r14@12  r11@16  r7@20  r12@24  r15@28
;   Row 1: r3@32 r1@36 r13@40 r6@44 r10@48 r9@52 r8@56 r16@60
;
; Register computations (from r2 = frame counter):
;   r5  = r2 * 2        (double)
;   r0  = r2 * 3        (triple)
;   r14  = r2 * 4        (quadruple)
;   r11  = r2 & 255      (low byte)
;   r7  = r2 * r2       (square)
;   r12  = r2 XOR 0xAAAA (pseudo-random)
;   r15  = r2 << 4       (shifted)
;   r3  = -r2           (negated)
;   r1 = r2 % 17       (modular)
;   r13 = r11 + r7       (sum)
;   r6 = r7 >> 8       (upper square)
;   r10 = r2 | 0x0F0F   (bitmask)
;   r9 = r12 & r15       (combination)
;   r8 = r2 + r3       (zero: r2 + NEG(r2))
;   r16 = r15 - r2       (r2 * 15)

  LDI r30, 0xFF00      ; Stack pointer for CALL/RET
  LDI r20, 10          ; Divisor constant
  LDI r21, 48          ; ASCII '0'
  LDI r22, 1           ; Increment constant

main_loop:
  ; === Update register values ===
  ADD r2, r22           ; r2 = frame counter (1, 2, 3, ...)

  MOV r5, r2            ; r5 = r2 * 2
  ADD r5, r2

  MOV r0, r5            ; r0 = r2 * 3
  ADD r0, r2

  MOV r14, r5            ; r14 = r2 * 4
  ADD r14, r5

  MOV r11, r2            ; r11 = r2 & 0xFF (low byte)
  LDI r23, 255
  AND r11, r23

  MOV r7, r2            ; r7 = r2 * r2 (square)
  MUL r7, r2

  MOV r12, r2            ; r12 = r2 XOR 0xAAAA
  LDI r23, 43690
  XOR r12, r23

  MOV r15, r2            ; r15 = r2 << 4
  LDI r23, 4
  SHL r15, r23

  MOV r3, r2            ; r3 = -r2 (negated)
  NEG r3

  MOV r1, r2           ; r1 = r2 % 17
  LDI r23, 17
  MOD r1, r23

  MOV r13, r11           ; r13 = r11 + r7
  ADD r13, r7

  MOV r6, r7           ; r6 = r7 >> 8
  LDI r23, 8
  SHR r6, r23

  MOV r10, r2           ; r10 = r2 | 0x0F0F
  LDI r23, 3855
  OR r10, r23

  MOV r9, r12           ; r9 = r12 & r15
  AND r9, r15

  MOV r8, r2           ; r8 = r2 + r3 = 0
  ADD r8, r3

  MOV r16, r15           ; r16 = r15 - r2 = r2*15
  SUB r16, r2

  ; === Display registers to canvas ===
  ; Row 0 (canvas indices 0-31)
  LDI r25, 0x8000
  MOV r26, r2
  CALL write_digits

  LDI r25, 0x8004
  MOV r26, r5
  CALL write_digits

  LDI r25, 0x8008
  MOV r26, r0
  CALL write_digits

  LDI r25, 0x800C
  MOV r26, r14
  CALL write_digits

  LDI r25, 0x8010
  MOV r26, r11
  CALL write_digits

  LDI r25, 0x8014
  MOV r26, r7
  CALL write_digits

  LDI r25, 0x8018
  MOV r26, r12
  CALL write_digits

  LDI r25, 0x801C
  MOV r26, r15
  CALL write_digits

  ; Row 1 (canvas indices 32-63)
  LDI r25, 0x8020
  MOV r26, r3
  CALL write_digits

  LDI r25, 0x8024
  MOV r26, r1
  CALL write_digits

  LDI r25, 0x8028
  MOV r26, r13
  CALL write_digits

  LDI r25, 0x802C
  MOV r26, r6
  CALL write_digits

  LDI r25, 0x8030
  MOV r26, r10
  CALL write_digits

  LDI r25, 0x8034
  MOV r26, r9
  CALL write_digits

  LDI r25, 0x8038
  MOV r26, r8
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
