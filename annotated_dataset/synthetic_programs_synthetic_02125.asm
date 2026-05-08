; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and enters a loop where it displays the text "HELLO" at a specified memory address, performs bitwise operations, shifts bits, and draws pixels on a frame. The program continuously jumps back to the beginning of the main loop after executing these operations.

; input driven program
; initialization
  LDI r15, 10
  LDI r4, 1363
  LDI r17, 259
  LDI r6, 0x104A8D
  LDI r13, 64
main_0:
  LDI r0, 0x53C188
  LDI r7, 3596
  LDI r1, 3004
  TEXT r0, r7, r1, "HELLO"
  CMPI r11, 0
  SUB r14, r0, r11
  LDI r5, 0xEFDA34
  LDI r13, 1947
  LDI r5, 2097
  WPIXEL
  ANDI r0, r5, 10
  SHLI r9, r12, 5
  SHLI r7, r25, 16
  SHL r3, r2, r1
  FRAME
  JMP main_0
