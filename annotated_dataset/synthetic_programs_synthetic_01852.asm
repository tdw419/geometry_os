; DESCRIPTION: This GeOS assembly code initializes various registers with specific values, draws the text "WORLD" at a designated position, and then enters a loop where it repeatedly draws circles while decrementing a counter until it reaches zero. The program halts after completing the loop.

; mixed program
; initialization
  LDI r11, 0x707187
  LDI r0, 10
  LDI r4, 402
  LDI r9, 480
  LDI r2, 0xC4B6F2
  SHR r0, r10, r2
  LDI r8, 749
  LDI r3, 2180
  LDI r2, 0x66B729
  DRAWTEXT r8, r3, r2, "WORLD"
  LDI r14, 0xCE9F0x23B2F
  STORE r14, r13
  LOAD r0, r14
  LDI r19, 10
  STORE r19, r14
  LOAD r15, r19
  LDI r2, 0xCF82C5
  STORE r2, r8
  LOAD r15, r2
  LDI r6, 0xD57C44
  STORE r6, r2
  LOAD r24, r6
  LDI r11, 1766
  STORE r11, r27
  LOAD r14, r11
  CMPI r9, 0x95145E
  LDI r6, 2999
  LDI r2, 1173
  LDI r11, 16
  LDI r13, 0xA9FC0E
  LDI r12, 1105
  RECTF r6, r2, r11, r13, r12
  LDI r3, 0xBBF49B
loop_0:
  LDI r8, 4
  LDI r4, 255
  LDI r15, 0x123AD1
  LDI r6, 256
  CIRCLE r8, r4, r15, r6
  CMPI r9, r0, 0x56DD82
  LDI r12, 1
  SUB r3, r3, r12
  JNZ r3, loop_0
  HALT
