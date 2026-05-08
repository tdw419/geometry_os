; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then enters a loop where it repeatedly draws text "WORLD" at coordinates (2, 0xABB00E) and "HELLO" at coordinates (3691, 16), while also performing bitwise operations on certain registers. The program uses the `DRAWTEXT`, `WPIXEL`, `OR`, `XOR`, and `TEXT` instructions to manipulate graphics and display text on a screen, continuously cycling through these actions.

; input driven program
; initialization
  LDI r5, 2733
  LDI r15, 0xD66A1C
  LDI r7, 677
  LDI r14, 3839
  LDI r2, 975
main_0:
  LDI r7, 2
  LDI r8, 0xABB00E
  LDI r0, 560
  DRAWTEXT r7, r8, r0, "WORLD"
  LDI r13, 64
  LDI r6, 2332
  LDI r4, 2893
  WPIXEL
  OR r6, r3, r7
  XOR r10, r8, r7
  LDI r9, 0x445A1D
  LDI r6, 3691
  LDI r2, 16
  TEXT r9, r6, r2, "HELLO"
  FRAME
  JMP main_0
