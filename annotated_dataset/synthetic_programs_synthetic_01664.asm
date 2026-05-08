; DESCRIPTION: The GeOS assembly code initializes registers with specific values and enters a loop where it draws text "HELLO" at a given position. It checks for a key press (specifically if the key is '40'), and if so, creates a frame; otherwise, it loops back to continue drawing.

; drawing loop program
; initialization
  LDI r2, 2243
  LDI r6, 256
  LDI r0, 128
  LDI r13, 1031
main_0:
  LDI r4, 0x33A9BC
  LDI r13, 0xAF6726
  LDI r10, 1942
  TEXT r4, r13, r10, "HELLO"
  CMPI r24, r1, 0x9C29E5
  SUBI r9, r5, 0xFC8228
  IKEY r7
  CMPI r7, 40
  JNZ r7, key_1
  FRAME
  JMP main_0
