; DESCRIPTION: This GeOS assembly code initializes various registers to set up drawing parameters and then performs a pixel setting (`PSET`) followed by a line drawing operation (`LINE`). The program halts afterward.

; simple draw program
; initialization
  LDI r2, 2530
  LDI r9, 0xE017F9
  LDI r12, 0xEAB78C
  LDI r15, 50
  LDI r11, 1
  LDI r9, 2519
  LDI r5, 4
  PSET r11, r9, r5
  LDI r3, 3851
  LDI r6, 1409
  LDI r5, 0x7006EA
  PSETI
  LDI r5, 0x0C30E0
  LDI r3, 0x46F82D
  LDI r0, 0x8BD455
  LDI r8, 32
  LDI r15, 0x88267A
  LINE r5, r3, r0, r8, r15
  HALT
