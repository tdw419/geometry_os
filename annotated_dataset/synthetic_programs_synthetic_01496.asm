; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and sets up a color palette. It then enters a loop where it waits for a key press; if the key '64' is pressed, it updates a register to a new value and calls the `FRAME` subroutine before looping back.

; drawing loop program
; initialization
  LDI r0, 4
  LDI r3, 0x813708
  LDI r15, 0x52BE88
  LDI r12, 0x2D449E
  LDI r7, 1540
  LDI r10, 256
  LDI r1, 2181
  LDI r5, 0x57A1C7
; palette
  LDI r3, 0x2026
  LDI r13, 1
  LDI r21, 0xFFAA00
  STORE r3, r21
  ADD r3, r3, r13
  LDI r21, 0x00FFFF
  STORE r3, r21
  ADD r3, r3, r13
  LDI r21, 0x008888
  STORE r3, r21
  ADD r3, r3, r13
  LDI r21, 0x444444
  STORE r3, r21
  ADD r3, r3, r13
  LDI r21, 0x00FF00
  STORE r3, r21
  ADD r3, r3, r13
main_0:
  IKEY r16
  CMPI r16, 64
  JNZ r16, key_1
  ADDI r14, r7, 64
  FRAME
  JMP main_0
