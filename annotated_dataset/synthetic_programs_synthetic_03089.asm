; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and enters an infinite loop (`main_0`) where it repeatedly fills a register (`r4`), compares `r5` to 255, shifts a value in `r10`, subtracts a constant from `r26`, checks if `r3` is less than 40, creates a frame, and jumps back to the start of the loop.

; input driven program
; initialization
  LDI r2, 0x01C626
  LDI r12, 0x8AABCB
  LDI r8, 0x2E7DFA
  LDI r5, 2
  LDI r11, 64
  LDI r3, 2799
  LDI r6, 0x6F7653
  LDI r1, 404
main_0:
  LDI r4, 0
  FILL r4
  CMPI r5, 255
  SHR r10, r4, r3
  SUBI r16, r26, 0x41C429
  CMPI r3, 40
  FRAME
  JMP main_0
