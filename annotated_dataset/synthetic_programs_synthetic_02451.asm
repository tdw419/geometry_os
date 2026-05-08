; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it draws rectangles using the `RECTF` instruction. It also performs bitwise shifts (`SHL`, `SHLI`) and arithmetic shifts (`SAR`), checks for a key press using `IKEY`, compares the key value, and branches to different sections based on the comparison result. The loop continues indefinitely, drawing frames with `FRAME`.

; drawing loop program
; initialization
  LDI r15, 64
  LDI r6, 484
  LDI r31, 2747
  LDI r8, 256
  LDI r1, 0xB9DE5A
main_0:
  LDI r12, 330
  LDI r13, 1787
  LDI r29, 506
  LDI r8, 0x2DDE7A
  LDI r9, 0xC8DBA1
  RECTF r12, r13, r29, r8, r9
  SHL r3, r6, r7
  SHLI r29, r0, 255
  SAR r9, r10, r1
  IKEY r4
  CMPI r4, 0x14338E
  JNZ r4, key_1
  FRAME
  JMP main_0
