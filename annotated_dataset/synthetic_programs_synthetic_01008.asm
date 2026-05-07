; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and sets a pixel on the screen at coordinates (3833, 3556) using the PSETI instruction. The program then halts execution.

; simple draw program
; initialization
  LDI r13, 3833
  LDI r5, 0x56A3C1
  LDI r11, 3556
  LDI r2, 0
  LDI r0, 255
  LDI r3, 10
  LDI r4, 2764
  LDI r12, 0x52069A
  LDI r6, 64
  PSETI
  HALT
