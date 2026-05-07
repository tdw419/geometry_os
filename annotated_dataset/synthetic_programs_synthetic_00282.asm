; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a drawing loop. The program continuously reads input from the keyboard and checks if the pressed key matches the value 126; if it does, it calls the `FRAME` function to update the display and then repeats the loop.

; drawing loop program
; initialization
  LDI r2, 1440
  LDI r7, 32
  LDI r8, 255
  LDI r18, 0xC1FC3B
  LDI r6, 1937
  LDI r12, 0xE1FED5
  LDI r9, 0x13957C
main_0:
  OR r0, r12, r4
  XOR r1, r2, r14
  XOR r17, r3, r11
  IKEY r15
  CMPI r15, 126
  JNZ r15, key_1
  FRAME
  JMP main_0
