; DESCRIPTION: Composite: Sets a single green pixel at (63, 247) then Creates a purple rectangular region at (57, 7) spanning 41 by 97 pixels then Draws a red line from (177, 175) to (131, 206).
; PLAN: r0=63(x), r1=247(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=57(x), r6=7(y), r7=41(width), r8=97(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=177(x1), r11=175(y1), r12=131(x2), r13=206(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 63
LDI r1, 247
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 57
LDI r6, 7
LDI r7, 41
LDI r8, 97
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 175
LDI r12, 131
LDI r13, 206
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
