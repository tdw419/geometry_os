; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and enters an infinite loop where it draws a rectangle using the `RECTF` instruction, increments a register value, writes a pixel to the frame buffer using `WPIXEL`, compares a register to another, and then displays the frame with `FRAME`. The loop repeats indefinitely.

; input driven program
; initialization
  LDI r3, 2756
  LDI r15, 255
  LDI r1, 0xA223A6
  LDI r4, 10
main_0:
  LDI r2, 2763
  LDI r0, 0xBEA3C1
  LDI r7, 4057
  LDI r9, 256
  LDI r13, 320
  RECTF r2, r0, r7, r9, r13
  ADDI r23, r1, 2
  LDI r11, 1130
  LDI r6, 2
  LDI r10, 3081
  WPIXEL
  CMP r1, r8
  FRAME
  JMP main_0
