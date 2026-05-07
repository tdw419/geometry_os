; DESCRIPTION: This GeOS assembly code initializes a program that repeatedly draws the text "WORLD" at two different positions and sizes on the screen, along with a colored circle. It checks for user input (specifically if the 'x' key is pressed) to trigger a screen refresh and then loops back to the start.

; input driven program
; initialization
  LDI r14, 16
  LDI r12, 0x964285
main_0:
  LDI r0, 0x6A7D27
  LDI r11, 2
  LDI r15, 1688
  DRAWTEXT r0, r11, r15, "WORLD"
  LDI r12, 3954
  LDI r12, 926
  LDI r5, 256
  LDI r6, 0xFFB0AC
  CIRCLE r12, r12, r5, r6
  LDI r15, 128
  LDI r8, 0x9DDB22
  LDI r12, 3958
  DRAWTEXT r15, r8, r12, "WORLD"
  SUBI r2, r1, 96
  ADDI r10, r13, 256
  IKEY r2
  CMPI r2, 120
  JNZ r2, key_1
  FRAME
  JMP main_0
