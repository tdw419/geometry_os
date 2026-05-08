; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and then uses these to draw pixels and lines on the screen. It sets up color and position parameters before drawing a line and halting execution.

; simple draw program
; initialization
  LDI r14, 0x609DFD
  LDI r7, 0xF50C65
  LDI r9, 128
  LDI r8, 0x1FBE3B
  LDI r11, 0xF1B3BA
  LDI r13, 3615
  LDI r1, 2484
  LDI r2, 0xB62CD2
  LDI r11, 0x448F63
  LDI r12, 16
  WPIXEL
  LDI r7, 543
  LDI r12, 3493
  LDI r3, 10
  PSETI
  LDI r5, 0x298A4F
  LDI r1, 128
  LDI r9, 1697
  LDI r3, 2
  LDI r5, 248
  LINE r5, r1, r9, r3, r5
  HALT
