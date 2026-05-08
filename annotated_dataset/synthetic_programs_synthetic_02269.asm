; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop where it repeatedly loads more register values, performs various shift operations (SAR for arithmetic right shift, SHL for left shift, SHLI for logical left shift), compares two registers, calls a function to draw a line (`LINE`), and jumps back to the start of the loop.

; input driven program
; initialization
  LDI r12, 1
  LDI r13, 2225
  LDI r5, 0xA3A553
  LDI r15, 128
  LDI r16, 1
main_0:
  LDI r10, 608
  LDI r8, 3752
  LDI r10, 618
  LDI r10, 1056
  LDI r29, 0x7F91D6
  LINE r10, r8, r10, r10, r29
  SAR r1, r2, r13
  SAR r8, r11, r4
  SHL r1, r0, r10
  SHLI r11, r21, 64
  CMP r14, r11
  FRAME
  JMP main_0
