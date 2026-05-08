; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it waits for a key press. If the pressed key matches the value `0xC3` (195 in decimal), it increments a register by `128`, calls a function to draw a frame, and then continues looping.

; drawing loop program
; initialization
  LDI r15, 0
  LDI r31, 0xBEDD12
  LDI r9, 0xBC229F
  LDI r7, 0x520835
  LDI r4, 16
  LDI r11, 0x4670A9
  LDI r6, 234
main_0:
  IKEY r8
  CMPI r8, 195
  JNZ r8, key_1
  ADDI r4, r9, 128
  FRAME
  JMP main_0
