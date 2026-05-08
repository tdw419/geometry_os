; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a counted loop (`loop_0`) that repeatedly sets a pixel using the `PSETI` instruction, decrements a counter, and checks if it has reached zero. After exiting the loop, it enters another loop (`loop_1`) that performs bitwise operations on registers until a condition is met, at which point the program halts.

; counted animation
; initialization
  LDI r7, 0x32AE55
  LDI r1, 0xAD1FC2
  LDI r6, 4
  LDI r2, 32
  LDI r24, 4
  LDI r8, 0xF1B58D
  LDI r2, 4
loop_0:
  LDI r1, 0x0207FA
  LDI r11, 2
  LDI r8, 1
  PSETI
  SUBI r10, r1, 16
  CMPI r8, r3, 84
  LDI r7, 1
  SUB r2, r2, r7
  JNZ r2, loop_0
  LDI r0, 26
loop_1:
  ANDI r15, r13, 4
  LDI r2, 1
  SUB r0, r0, r2
  JNZ r0, loop_1
  HALT
