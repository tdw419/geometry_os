; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and enters an infinite loop (`main_0`) where it repeatedly calls the `TEXT` function to draw the string "HELLO" at coordinates determined by register values. It also performs bitwise shift operations on registers, updates frame data, and jumps back to the start of the loop.

; drawing loop program
; initialization
  LDI r2, 2577
  LDI r0, 128
  LDI r3, 70
  LDI r5, 3605
  LDI r13, 0x80E488
  LDI r4, 255
  LDI r9, 703
main_0:
  LDI r8, 4054
  LDI r6, 0xD7E228
  LDI r1, 874
  TEXT r8, r6, r1, "HELLO"
  SHL r14, r4, r8
  SHL r13, r4, r6
  SHL r4, r2, r7
  FRAME
  JMP main_0
