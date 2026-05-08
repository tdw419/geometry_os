; DESCRIPTION: This GeOS assembly code initializes registers and enters a drawing loop where it checks input values from specific keys (r9, r2, r20) against predefined constants. If the conditions are met, it performs bit shifting operations on registers r4, r6, and r5, then calls a FRAME subroutine before repeating the loop.

; drawing loop program
; initialization
  LDI r11, 2366
  LDI r12, 0x05695B
main_0:
  CMP r14, r6
  IKEY r9
  CMPI r9, 0x621799
  JNZ r9, key_1
  IKEY r2
  CMPI r2, 0
  JNZ r2, key_2
  IKEY r20
  CMPI r20, 0xB02FBB
  JNZ r20, key_3
  SHL r4, r10, r9
  SHR r6, r5, r12
  SHLI r6, r5, 6
  FRAME
  JMP main_0
