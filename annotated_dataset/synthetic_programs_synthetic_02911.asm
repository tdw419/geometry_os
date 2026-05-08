; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, sets up a color palette, calls a function to perform arithmetic operations, and then draws text on the screen. The program ends with halting execution.

; mixed program
; initialization
  LDI r2, 0xF44C25
  LDI r17, 255
  LDI r14, 2
  LDI r5, 1813
  LDI r6, 0x5E9193
  LDI r7, 2
  LDI r1, 255
; palette
  LDI r4, 0x60BC
  LDI r2, 1
  LDI r9, 0xDD0044
  STORE r4, r9
  ADD r4, r4, r2
  LDI r9, 0x0044FF
  STORE r4, r9
  ADD r4, r4, r2
  LDI r9, 0xFFFFFF
  STORE r4, r9
  ADD r4, r4, r2
  LDI r9, 0xFF00FF
  STORE r4, r9
  ADD r4, r4, r2
  CALL func_0
func_0:
  MUL r3, r8, r15
  DIV r10, r0, r21
  SHR r15, r2, r13
  SUB r8, r9, r0
  RET
  LDI r14, 0x02F70A
  LDI r7, 64
  LDI r8, 2083
  DRAWTEXT r14, r7, r8, "WORLD"
  LDI r15, 4
  LDI r18, 64
  LDI r27, 0xDF2F08
  TEXT r15, r18, r27, "HELLO"
  SHLI r17, r4, 0x583804
  SHR r6, r11, r5
  LDI r8, 861
  LDI r0, 486
  LDI r6, 0x07F743
  PSETI
  HALT
