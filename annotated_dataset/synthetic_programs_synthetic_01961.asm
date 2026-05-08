; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then enters a loop to perform counted animations. It sets pixels at specific coordinates, shifts bits, and draws circles, decrementing counters until the loops complete, then halts execution.

; counted animation
; initialization
  LDI r0, 1993
  LDI r11, 0xFD121C
  LDI r9, 2918
  LDI r12, 3153
  LDI r2, 0x5510BD
  LDI r15, 8
loop_0:
  LDI r10, 32
  LDI r9, 0x3B3677
  LDI r9, 922
  PSETI
  SHR r2, r12, r5
  LDI r10, 1
  SUB r15, r15, r10
  JNZ r15, loop_0
  LDI r8, 32
loop_1:
  LDI r1, 0x4B939A
  LDI r14, 3640
  LDI r6, 8
  LDI r2, 256
  CIRCLE r1, r14, r6, r2
  CMPI r4, r14, 133
  MUL r15, r13, r8
  LDI r6, 1
  SUB r8, r8, r6
  JNZ r8, loop_1
  HALT
