; DESCRIPTION: This GeOS assembly code initializes a counting animation by setting up registers and then enters a loop where it repeatedly writes pixels to the display using the `WPIXEL` instruction. The loop continues until the counter in register `r2` reaches zero, at which point the program halts.

; counted animation
; initialization
  LDI r22, 1110
  LDI r0, 16
  LDI r2, 40
loop_0:
  LDI r9, 0x07A5BC
  LDI r17, 10
  LDI r15, 0x6E46AC
  WPIXEL
  SHR r10, r4, r0
  LDI r0, 1
  SUB r2, r2, r0
  JNZ r2, loop_0
  HALT
