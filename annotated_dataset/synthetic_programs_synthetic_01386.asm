; DESCRIPTION: This GeOS assembly code implements a drawing loop that continuously processes input from two keys. It shifts and manipulates registers to perform calculations and logical operations, then checks the state of the first key. If pressed (value 1), it fills a region with a specified color (3811) and waits for another key press (85) to draw a frame before repeating the loop.

; drawing loop program
; initialization
  LDI r15, 0xF96531
  LDI r20, 32
  LDI r14, 1985
main_0:
  SHL r4, r0, r2
  SAR r5, r12, r14
  SAR r3, r2, r10
  ANDI r9, r6, 157
  AND r1, r10, r30
  XOR r8, r1, r14
  OR r0, r11, r1
  IKEY r4
  CMPI r4, 1
  JNZ r4, key_1
  LDI r5, 3811
  FILL r5
  IKEY r3
  CMPI r3, 85
  JNZ r3, key_2
  FRAME
  JMP main_0
