; DESCRIPTION: This GeOS assembly code initializes several registers and enters an infinite loop where it performs a series of bitwise operations on these registers. It then uses the `TEXT` instruction to display the string "HELLO" on the screen, presumably in a graphical or text-based user interface, before repeating the process indefinitely.

; drawing loop program
; initialization
  LDI r13, 2960
  LDI r0, 0x390DC2
  LDI r7, 3869
  LDI r11, 0xC2AEA0
  LDI r15, 64
  LDI r4, 8
main_0:
  SHLI r7, r3, 0
  SHL r15, r11, r0
  SHL r1, r11, r10
  SHLI r2, r1, 16
  SAR r3, r2, r11
  SAR r8, r11, r6
  SHL r3, r8, r19
  LDI r14, 0xCA96AB
  LDI r15, 484
  LDI r11, 0xFF91EF
  TEXT r14, r15, r11, "HELLO"
  FRAME
  JMP main_0
