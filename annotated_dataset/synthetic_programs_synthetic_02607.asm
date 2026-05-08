; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it performs bitwise shifts, comparisons, and drawing operations to display the text "WORLD" on the screen repeatedly. The loop continuously updates register values and checks conditions before redrawing the frame.

; drawing loop program
; initialization
  LDI r15, 0x6B1741
  LDI r7, 0x05C8DF
main_0:
  SHL r5, r9, r3
  SHLI r28, r15, 7
  SHL r10, r12, r2
  SHR r5, r2, r11
  CMPI r15, r0, 0xCCD67D
  CMPI r7, 12
  LDI r13, 0xE02174
  LDI r15, 0xF328F0
  LDI r0, 32
  DRAWTEXT r13, r15, r0, "WORLD"
  CMPI r4, 45
  FRAME
  JMP main_0
