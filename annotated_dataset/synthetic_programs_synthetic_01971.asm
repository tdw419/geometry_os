; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a counted loop that repeatedly fills memory locations and decrements a counter until the counter reaches zero, at which point it halts execution.

; counted animation
; initialization
  LDI r6, 4
  LDI r7, 8
  LDI r4, 1947
  LDI r15, 255
  LDI r0, 2809
  LDI r5, 3437
  LDI r14, 0x85ACA7
  LDI r2, 256
  LDI r9, 39
loop_0:
  LDI r4, 16
  FILL r4
  MOD r10, r7, r0
  LDI r7, 1
  SUB r9, r9, r7
  JNZ r9, loop_0
  HALT
