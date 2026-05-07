; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and enters an infinite loop. Within the loop, it compares a register to 16 and checks if another register is equal to yet another, then calls a frame routine before jumping back to the start of the loop.

; input driven program
; initialization
  LDI r9, 3239
  LDI r11, 255
  LDI r14, 1957
  LDI r15, 32
  LDI r7, 1969
main_0:
  CMPI r7, 16
  CMP r0, r8
  FRAME
  JMP main_0
