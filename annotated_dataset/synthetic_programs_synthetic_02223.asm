; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and sets up a color palette. It then enters a loop where it checks for a key press (`0x4D48BE`), updates coordinates if the key is pressed, draws text "HELLO" at those coordinates, and continuously refreshes the display frame.

; drawing loop program
; initialization
  LDI r13, 0x8F11DF
  LDI r2, 52
  LDI r7, 980
  LDI r10, 2078
  LDI r6, 4
  LDI r5, 3609
  LDI r1, 128
; palette
  LDI r1, 0x212A
  LDI r24, 1
  LDI r13, 0x008888
  STORE r1, r13
  ADD r1, r1, r24
  LDI r13, 0xFFAA00
  STORE r1, r13
  ADD r1, r1, r24
  LDI r13, 0x00FF44
  STORE r1, r13
  ADD r1, r1, r24
  LDI r13, 0x8800FF
  STORE r1, r13
  ADD r1, r1, r24
main_0:
  ADD r9, r2, r15
  SHL r1, r13, r5
  IKEY r3
  CMPI r3, 0x4D48BE
  JNZ r3, key_1
  LDI r10, 10
  LDI r7, 1319
  LDI r2, 0xA3B52D
  TEXT r10, r7, r2, "HELLO"
  CMPI r11, 9
  CMP r10, r7
  FRAME
  JMP main_0
