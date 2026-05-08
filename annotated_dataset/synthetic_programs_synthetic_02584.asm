; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it adds 56 to the value in register r16, shifts the value in register r5 right by the amount in register r3 into register r8, creates a stack frame, and then jumps back to the start of the loop.

; input driven program
; initialization
  LDI r24, 0x56E373
  LDI r9, 4
  LDI r5, 2217
  LDI r6, 10
  LDI r12, 1
  LDI r30, 255
main_0:
  ADDI r4, r16, 56
  SHR r5, r3, r8
  FRAME
  JMP main_0
