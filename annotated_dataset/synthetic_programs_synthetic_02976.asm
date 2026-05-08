; DESCRIPTION: This GeOS assembly code initializes several registers and enters a loop where it performs bitwise operations on them. It checks for specific key inputs (0x9A8B1D and 149), and if matched, modifies other register values and calls the `FRAME` routine before repeating the loop.

; drawing loop program
; initialization
  LDI r5, 795
  LDI r6, 8
  LDI r10, 255
  LDI r4, 0x4262E9
  LDI r1, 256
  LDI r2, 0xE9D82C
main_0:
  SAR r3, r8, r2
  SHR r11, r2, r5
  SAR r14, r2, r3
  SHLI r11, r10, 0
  SHLI r15, r13, 0xB2FCC6
  SHR r10, r11, r8
  IKEY r13
  CMPI r13, 0x9A8B1D
  JNZ r13, key_1
  IKEY r7
  CMPI r7, 149
  JNZ r7, key_2
  ADDI r6, r15, 10
  FRAME
  JMP main_0
