; DESCRIPTION: Composite: Creates a cyan rectangular region at (486, 137) spanning 26 by 67 pixels then Draws a magenta line from (458, 90) to (451, 124) then Sets a single white pixel at (67, 58).
; PLAN: r0=486(x), r1=137(y), r2=26(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=458(x1), r6=90(y1), r7=451(x2), r8=124(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=67(x), r11=58(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 486
LDI r1, 137
LDI r2, 26
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 90
LDI r7, 451
LDI r8, 124
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 58
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
