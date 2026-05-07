; DESCRIPTION: This GeOS assembly code performs conditional logic based on a comparison between registers r6 and r15. If they are equal, it adds the value in r4 to the sum of r7 and r11; otherwise, it executes a series of instructions including loading values into various registers, setting pixels using PSETI, and drawing a rectangle with RECTF before halting execution.

; conditional logic
; initialization
  LDI r4, 0x2ADD2C
  LDI r15, 1396
  LDI r12, 3124
  CMP r6, r15
  JNZ r6, else_0
  ADD r7, r11, r4
  JMP endif_1
else_0:
  LDI r5, 0x17DF6C
  FILL r5
  LDI r8, 1055
  LDI r6, 1185
  LDI r2, 0x5F5E4C
  PSETI
  LDI r10, 188
  LDI r4, 3272
  LDI r12, 0x0EAF22
  PSETI
  LDI r5, 0xD646D0
  LDI r9, 16
  LDI r10, 0x0BED29
  LDI r2, 2707
  LDI r8, 0x300267
  RECTF r5, r9, r10, r2, r8
endif_1:
  HALT
