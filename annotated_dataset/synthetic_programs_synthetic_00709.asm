; DESCRIPTION: The GeOS assembly code initializes various registers with specific values and then enters two loops. The first loop (`loop_0`) repeatedly shifts a value in register `r8` by the contents of `r3` and `r20`, draws a line using the LINE command, decrements `r9`, and continues until `r9` reaches zero. The second loop (`loop_1`) multiplies values in registers `r1` and `r11` with `r15`, draws a circle using the CIRCLE command, decrements `r21`, and continues until `r21` reaches zero. The code halts execution after both loops complete.

; counted animation
; initialization
  LDI r9, 0x120F14
  LDI r10, 868
  LDI r6, 0x2CD0B5
  LDI r15, 0x55EE7A
  LDI r1, 0xFAAB00
  LDI r29, 1821
  LDI r9, 16
loop_0:
  SHL r8, r3, r20
  LDI r10, 2
  LDI r24, 2150
  LDI r1, 1939
  LDI r1, 0x656A2F
  LDI r12, 16
  LINE r10, r24, r1, r1, r12
  LDI r14, 1
  SUB r9, r9, r14
  JNZ r9, loop_0
  LDI r21, 0xEA12D7
loop_1:
  MUL r1, r11, r15
  LDI r1, 303
  LDI r17, 1317
  LDI r18, 2518
  LDI r1, 0x53EA6F
  CIRCLE r1, r17, r18, r1
  LDI r29, 1
  SUB r21, r21, r29
  JNZ r21, loop_1
  HALT
