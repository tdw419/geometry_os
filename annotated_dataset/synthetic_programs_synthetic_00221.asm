; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a drawing loop where it checks for key input. If the key '4' is pressed, it performs a series of bitwise operations to manipulate register values, draws a circle using the `CIRCLE` instruction, and displays the text "WORLD" at a specified position using `DRAWTEXT`. The code then updates frame-related registers and loops back to check for further input.

; drawing loop program
; initialization
  LDI r0, 0x703090
  LDI r11, 931
  LDI r13, 0
  LDI r12, 0xB68CB4
  LDI r4, 0xFA9B7F
  LDI r7, 3564
  LDI r10, 0x4A7AFD
main_0:
  IKEY r13
  CMPI r13, 4
  JNZ r13, key_1
  SHR r6, r1, r14
  SHLI r6, r2, 2
  SHL r11, r13, r27
  SHL r0, r13, r12
  LDI r7, 32
  LDI r9, 3510
  LDI r11, 256
  LDI r10, 0x4B13EC
  CIRCLE r7, r9, r11, r10
  LDI r4, 0xB476E7
  LDI r12, 0xE22F2E
  LDI r13, 0x83ABEC
  DRAWTEXT r4, r12, r13, "WORLD"
  SHR r11, r9, r13
  SAR r15, r1, r2
  FRAME
  JMP main_0
