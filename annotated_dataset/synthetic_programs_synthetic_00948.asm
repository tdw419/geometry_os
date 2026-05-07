; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then enters a loop where it repeatedly draws text and sets pixels on the screen. It uses operations like `DRAWTEXT`, `PSETI`, and `FRAME` to render graphics, and includes bitwise shift instructions (`SHLI`, `SAR`, `SHL`, `SHR`) that manipulate register contents.

; input driven program
; initialization
  LDI r15, 1
  LDI r5, 32
  LDI r10, 0xBF9DF3
  LDI r1, 1915
main_0:
  LDI r3, 0xC3E52A
  LDI r8, 0x2C91DC
  LDI r7, 0x3C1867
  DRAWTEXT r3, r8, r7, "WORLD"
  LDI r12, 0
  LDI r12, 0xA64256
  LDI r21, 0x5A01EE
  PSETI
  LDI r15, 1778
  LDI r10, 0x42573B
  LDI r11, 0
  TEXT r15, r10, r11, "HELLO"
  LDI r8, 32
  LDI r14, 0
  LDI r5, 0x7DCAA3
  TEXT r8, r14, r5, "HELLO"
  SHLI r8, r9, 0x6D0EDA
  SAR r2, r4, r15
  SHL r5, r11, r15
  SHR r1, r13, r0
  FRAME
  JMP main_0
