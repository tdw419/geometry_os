; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters an infinite loop where it draws the text "HELLO" at a calculated position on the screen. It then performs a series of bitwise operations on the register values before repeating the loop.

; drawing loop program
; initialization
  LDI r4, 0x1FF90E
  LDI r9, 0x2585DE
  LDI r13, 0
  LDI r11, 0xAD0678
  LDI r7, 0xD85B06
  LDI r15, 0x83A54D
  LDI r8, 16
  LDI r10, 1
main_0:
  LDI r19, 2380
  LDI r7, 97
  LDI r1, 2631
  TEXT r19, r7, r1, "HELLO"
  ADDI r7, r24, 0xA53A53
  SAR r15, r8, r11
  SHLI r15, r13, 10
  SHR r15, r10, r0
  SHR r2, r3, r12
  FRAME
  JMP main_0
