; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a counted loop where it repeatedly subtracts the value in register `r7` from `r13`, decrements `r11`, and checks if `r11` is non-zero to continue looping. The loop runs 23 times before halting.

; counted animation
; initialization
  LDI r13, 64
  LDI r7, 0xA83625
  LDI r11, 3445
  LDI r11, 23
loop_0:
  SUB r13, r14, r7
  LDI r6, 1
  SUB r11, r11, r6
  JNZ r11, loop_0
  HALT
