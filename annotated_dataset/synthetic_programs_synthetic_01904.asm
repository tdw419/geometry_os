; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it draws a circle and displays text "HELLO" on the screen. The program waits for a key press to update the frame, repeating this process indefinitely.

; drawing loop program
; initialization
  LDI r6, 256
  LDI r0, 3450
  LDI r15, 255
  LDI r18, 0xA12A66
  LDI r1, 8
  LDI r29, 2520
  LDI r7, 0xD8A7A6
main_0:
  CMPI r8, 0xD8F4B4
  ADDI r8, r9, 169
  SUBI r1, r9, 64
  LDI r2, 256
  LDI r9, 255
  LDI r3, 2010
  LDI r12, 0xAF6CFC
  CIRCLE r2, r9, r3, r12
  LDI r14, 0x6DE587
  LDI r10, 64
  LDI r4, 1432
  TEXT r14, r10, r4, "HELLO"
  IKEY r7
  CMPI r7, 255
  JNZ r7, key_1
  FRAME
  JMP main_0
