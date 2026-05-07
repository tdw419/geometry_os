; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it repeatedly sets a pixel using the `WPIXEL` instruction. The loop continues until the value in register `r11` reaches zero, at which point the program halts.

; counted animation
; initialization
  LDI r8, 0xE6BDF6
  LDI r5, 0xF2E47A
  LDI r12, 3839
  LDI r0, 2
  LDI r11, 0x1A150F
loop_0:
  LDI r4, 0x58C56B
  LDI r6, 0xACB6FA
  LDI r3, 2902
  WPIXEL
  SUBI r25, r0, 0xDFEE99
  ANDI r9, r4, 0x5A4ED2
  OR r3, r0, r14
  LDI r5, 1
  SUB r11, r11, r5
  JNZ r11, loop_0
  HALT
