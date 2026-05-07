; DESCRIPTION: This GeOS assembly code initializes several registers and then draws a line on the screen using the `LINE` instruction. The program sets up color values, coordinates, and other parameters before halting execution.

; simple draw program
; initialization
  LDI r0, 256
  LDI r13, 3488
  LDI r2, 0xCC5AC6
  LDI r2, 872
  LDI r10, 0xA60B00
  PSETI
  LDI r7, 0x4A159F
  LDI r3, 255
  LDI r4, 8
  LDI r8, 32
  LDI r10, 256
  LINE r7, r3, r4, r8, r10
  HALT
