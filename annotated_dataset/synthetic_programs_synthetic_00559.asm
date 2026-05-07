; DESCRIPTION: This GeOS assembly code initializes registers with specific values and sets up a color palette. It then calls a function `func_0` to perform modulo operations on certain registers. The program enters a loop where it waits for a key press, checks its value, and if it matches `0xEC1400`, draws text "WORLD" at specified coordinates using the palette colors. The frame is updated continuously in a loop.

; mixed program
; initialization
  LDI r3, 0x4D9C87
  LDI r0, 0x645A30
  LDI r7, 0x7BE021
; palette
  LDI r13, 0x603F
  LDI r12, 1
  LDI r8, 0xFFEE00
  STORE r13, r8
  ADD r13, r13, r12
  LDI r8, 0x00FFFF
  STORE r13, r8
  ADD r13, r13, r12
  LDI r8, 0x0000CC
  STORE r13, r8
  ADD r13, r13, r12
  LDI r8, 0x00FF44
  STORE r13, r8
  ADD r13, r13, r12
  LDI r8, 0xAA00AA
  STORE r13, r8
  ADD r13, r13, r12
  LDI r8, 0xAA00AA
  STORE r13, r8
  ADD r13, r13, r12
  LDI r8, 0xFF0000
  STORE r13, r8
  ADD r13, r13, r12
  LDI r8, 0xFFFF00
  STORE r13, r8
  ADD r13, r13, r12
  LDI r8, 0xFFFF00
  STORE r13, r8
  ADD r13, r13, r12
  CALL func_0
func_0:
  MOD r12, r10, r1
  MOD r13, r9, r8
  RET
  LDI r12, 2
loop_1:
  ADDI r0, r1, 0
  LDI r13, 1
  SUB r12, r12, r13
  JNZ r12, loop_1
  IKEY r10
  CMPI r10, 0xEC1400
  JNZ r10, key_2
main_3:
  LDI r8, 16
  LDI r4, 0x9E077F
  LDI r2, 3975
  PSETI
  LDI r10, 1796
  LDI r1, 2205
  LDI r7, 0x51E948
  PSETI
  LDI r1, 255
  LDI r5, 0x6112FA
  LDI r0, 10
  DRAWTEXT r1, r5, r0, "WORLD"
  CMPI r9, r3, 28
  FRAME
  JMP main_3
