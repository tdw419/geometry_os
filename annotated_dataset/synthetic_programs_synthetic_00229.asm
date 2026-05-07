; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and sets up a color palette. It then enters a drawing loop where it checks for key presses to modify certain variables and draws pixels on the screen using the `PSET` instruction, updating the frame with `FRAME`. The loop continues indefinitely until a condition is met.

; drawing loop program
; initialization
  LDI r20, 0x5CAA1E
  LDI r4, 0x6CD04A
  LDI r13, 3938
  LDI r8, 8
  LDI r6, 0
  LDI r11, 3529
  LDI r1, 16
  LDI r7, 0x679EF3
; palette
  LDI r6, 0x219E
  LDI r24, 1
  LDI r2, 0x444444
  STORE r6, r2
  ADD r6, r6, r24
  LDI r2, 0x888800
  STORE r6, r2
  ADD r6, r6, r24
  LDI r2, 0x00FF00
  STORE r6, r2
  ADD r6, r6, r24
  LDI r2, 0x0000FF
  STORE r6, r2
  ADD r6, r6, r24
  LDI r2, 0xFF8800
  STORE r6, r2
  ADD r6, r6, r24
  LDI r2, 0xFFFF00
  STORE r6, r2
  ADD r6, r6, r24
  LDI r2, 0x00FF00
  STORE r6, r2
  ADD r6, r6, r24
  LDI r2, 0x000000
  STORE r6, r2
  ADD r6, r6, r24
  LDI r2, 0x000066
  STORE r6, r2
  ADD r6, r6, r24
  LDI r2, 0x880088
  STORE r6, r2
  ADD r6, r6, r24
  LDI r2, 0xFF4400
  STORE r6, r2
  ADD r6, r6, r24
  LDI r2, 0x00FFFF
  STORE r6, r2
  ADD r6, r6, r24
  LDI r2, 0xAAAAAA
  STORE r6, r2
  ADD r6, r6, r24
  LDI r2, 0x00FFAA
  STORE r6, r2
  ADD r6, r6, r24
  LDI r2, 0xFFEE00
  STORE r6, r2
  ADD r6, r6, r24
  LDI r2, 0xFF0000
  STORE r6, r2
  ADD r6, r6, r24
main_0:
  LDI r7, 64
  LDI r13, 2960
  LDI r11, 1
  PSET r7, r13, r11
  IKEY r6
  CMPI r6, 16
  JNZ r6, key_1
  IKEY r12
  CMPI r12, 32
  JNZ r12, key_2
  CMPI r15, r11, 64
  ADDI r9, r8, 10
  FRAME
  JMP main_0
