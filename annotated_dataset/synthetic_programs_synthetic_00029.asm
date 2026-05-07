; DESCRIPTION: This GeOS assembly code initializes a graphics environment, sets up a color palette, draws pixels, fills the screen with a color, waits for a key press, and continuously displays text on the screen while checking for specific conditions.

; mixed program
; initialization
  LDI r10, 0x8E6A9C
  LDI r7, 4
; palette
  LDI r14, 0x5009
  LDI r15, 1
  LDI r3, 0x880088
  STORE r14, r3
  ADD r14, r14, r15
  LDI r3, 0x444444
  STORE r14, r3
  ADD r14, r14, r15
  LDI r3, 0xFFFFFF
  STORE r14, r3
  ADD r14, r14, r15
  LDI r3, 0x00FFAA
  STORE r14, r3
  ADD r14, r14, r15
  LDI r3, 0x00FFAA
  STORE r14, r3
  ADD r14, r14, r15
  LDI r9, 3737
  LDI r27, 3722
  LDI r15, 32
  WPIXEL
  LDI r7, 0xB5D4C6
  FILL r7
  IKEY r25
  CMPI r25, 1
  JNZ r25, key_0
main_1:
  LDI r13, 0x644FD1
  LDI r12, 0x61938A
  LDI r3, 255
  DRAWTEXT r13, r12, r3, "WORLD"
  AND r4, r16, r1
  CMPI r5, r4, 0xA4C8B4
  FRAME
  JMP main_1
