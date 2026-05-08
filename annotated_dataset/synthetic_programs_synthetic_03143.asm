; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop where it repeatedly loads addresses and strings into other registers, performs a text operation (`TEXT`), draws text on the screen (`DRAWTEXT`), shifts bits left in one register (`SHLI`), shifts bits right in another register (`SAR`), updates the display frame (`FRAME`), and jumps back to the start of the loop (`JMP main_0`).

; input driven program
; initialization
  LDI r13, 0x3262F7
  LDI r14, 291
  LDI r11, 32
  LDI r15, 0x4D98A9
  LDI r5, 0x69B244
main_0:
  LDI r10, 0x44FB17
  LDI r2, 795
  LDI r13, 1447
  TEXT r10, r2, r13, "HELLO"
  LDI r9, 1017
  LDI r9, 0x8148AD
  LDI r3, 64
  DRAWTEXT r9, r9, r3, "WORLD"
  SHLI r15, r1, 0x67FF9D
  SAR r12, r6, r10
  FRAME
  JMP main_0
