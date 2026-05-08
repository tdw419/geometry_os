; DESCRIPTION: This GeOS assembly code implements a drawing loop that continuously draws lines on the screen. The program initializes various registers with specific values and uses bitwise operations to manipulate these registers within an infinite loop, calling the `LINE` function to draw lines based on the register values.

; drawing loop program
; initialization
  LDI r14, 255
  LDI r27, 0x9E9BE9
  LDI r12, 3203
  LDI r6, 0xCB356D
  LDI r11, 0x7946DE
  LDI r5, 0x57DF00
  LDI r9, 2
  LDI r1, 3946
main_0:
  SHR r1, r31, r10
  SHL r1, r8, r0
  SAR r11, r26, r2
  LDI r0, 0x89DBB7
  LDI r2, 0xD69DF0
  LDI r14, 0
  LDI r5, 64
  LDI r1, 2
  LINE r0, r2, r14, r5, r1
  SHR r12, r4, r2
  SHLI r11, r12, 3
  SHR r15, r18, r10
  SHL r10, r14, r15
  FRAME
  JMP main_0
