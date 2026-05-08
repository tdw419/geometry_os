; DESCRIPTION: The GeOS assembly code initializes registers and sets up a color palette. It then enters a loop where it calculates values, displays the text "HELLO" on the screen, and uses bitwise operations before jumping back to the start of the loop.

; drawing loop program
; initialization
  LDI r12, 1252
  LDI r11, 256
  LDI r25, 255
  LDI r4, 2247
; palette
  LDI r0, 0x607A
  LDI r3, 1
  LDI r4, 0x00AAFF
  STORE r0, r4
  ADD r0, r0, r3
  LDI r4, 0x00AAFF
  STORE r0, r4
  ADD r0, r0, r3
  LDI r4, 0x444444
  STORE r0, r4
  ADD r0, r0, r3
  LDI r4, 0xAAAAAA
  STORE r0, r4
  ADD r0, r0, r3
main_0:
  SUBI r9, r1, 0x1FFE9D
  LDI r14, 3861
  LDI r4, 1728
  LDI r5, 331
  TEXT r14, r4, r5, "HELLO"
  SHL r6, r8, r12
  SAR r3, r14, r12
  CMPI r11, 255
  FRAME
  JMP main_0
