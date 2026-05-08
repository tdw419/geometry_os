; DESCRIPTION: Geometry OS program to draw a colored object.

; register_dashboard.asm
; Phase 50: Live Register Dashboard
;
; The canvas grid shows live register values as 4-digit decimals.
; r7 counts up each frame. r11-r16 derive from r7 via arithmetic.
; 8 registers per row, 4 digits each, 2 rows = 16 registers.
; The grid IS the debug view -- no separate inspector.
;
; Layout (canvas buffer indices, addresses = 0x8000 + index):
;   Row 0: r7@0  r11@4  r2@8  r3@12  r4@16  r6@20  r5@24  r13@28
;   Row 1: r9@32 r1@36 r15@40 r8@44 r14@48 r10@52 r0@56 r16@60
;
; Register computations (from r7 = frame counter):
;   r11  = r7 * 2        (double)
;   r2  = r7 * 3        (triple)
;   r3  = r7 * 4        (quadruple)
;   r4  = r7 & 255      (low byte)
;   r6  = r7 * r7       (square)
;   r5  = r7 XOR 0xAAAA (pseudo-random)
;   r13  = r7 << 4       (shifted)
;   r9  = -r7           (negated)
;   r1 = r7 % 17       (modular)
;   r15 = r4 + r6       (sum)
;   r8 = r6 >> 8       (upper square)
;   r14 = r7 | 0x0F0F   (bitmask)
;   r10 = r5 & r13       (combination)
;   r0 = r7 + r9       (zero: r7 + NEG(r7))
;   r16 = r13 - r7       (r7 * 15)

  LDI r30, 0xFF00      ; Stack pointer for CALL/RET
  LDI r20, 10          ; Divisor constant
  LDI r21, 48          ; ASCII '0'
  LDI r22, 1           ; Increment constant

main_loop:
  ; === Update register values ===
  ADD r7, r22           ; r7 = frame counter (1, 2, 3, ...)

  MOV r11, r7            ; r11 = r7 * 2
  ADD r11, r7

  MOV r2, r11            ; r2 = r7 * 3
  ADD r2, r7

  MOV r3, r11            ; r3 = r7 * 4
  ADD r3, r11

  MOV r4, r7            ; r4 = r7 & 0xFF (low byte)
  LDI r23, 255
  AND r4, r23

  MOV r6, r7            ; r6 = r7 * r7 (square)
  MUL r6, r7

  MOV r5, r7            ; r5 = r7 XOR 0xAAAA
  LDI r23, 43690
  XOR r5, r23

  MOV r13, r7            ; r13 = r7 << 4
  LDI r23, 4
  SHL r13, r23

  MOV r9, r7            ; r9 = -r7 (negated)
  NEG r9

  MOV r1, r7           ; r1 = r7 % 17
  LDI r23, 17
  MOD r1, r23

  MOV r15, r4           ; r15 = r4 + r6
  ADD r15, r6

  MOV r8, r6           ; r8 = r6 >> 8
  LDI r23, 8
  SHR r8, r23

  MOV r14, r7           ; r14 = r7 | 0x0F0F
  LDI r23, 3855
  OR r14, r23

  MOV r10, r5           ; r10 = r5 & r13
  AND r10, r13

  MOV r0, r7           ; r0 = r7 + r9 = 0
  ADD r0, r9

  MOV r16, r13           ; r16 = r13 - r7 = r7*15
  SUB r16, r7

  ; === Display registers to canvas ===
  ; Row 0 (canvas indices 0-31)
  LDI r25, 0x8000
  MOV r26, r7
  CALL write_digits

  LDI r25, 0x8004
  MOV r26, r11
  CALL write_digits

  LDI r25, 0x8008
  MOV r26, r2
  CALL write_digits

  LDI r25, 0x800C
  MOV r26, r3
  CALL write_digits

  LDI r25, 0x8010
  MOV r26, r4
  CALL write_digits

  LDI r25, 0x8014
  MOV r26, r6
  CALL write_digits

  LDI r25, 0x8018
  MOV r26, r5
  CALL write_digits

  LDI r25, 0x801C
  MOV r26, r13
  CALL write_digits

  ; Row 1 (canvas indices 32-63)
  LDI r25, 0x8020
  MOV r26, r9
  CALL write_digits

  LDI r25, 0x8024
  MOV r26, r1
  CALL write_digits

  LDI r25, 0x8028
  MOV r26, r15
  CALL write_digits

  LDI r25, 0x802C
  MOV r26, r8
  CALL write_digits

  LDI r25, 0x8030
  MOV r26, r14
  CALL write_digits

  LDI r25, 0x8034
  MOV r26, r10
  CALL write_digits

  LDI r25, 0x8038
  MOV r26, r0
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
