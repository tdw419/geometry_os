; DESCRIPTION: Composite: Draws a orange line from (214, 182) to (259, 240) then Creates a green rectangular region at (31, 109) spanning 74 by 55 pixels.
; PLAN: r0=214(x1), r1=182(y1), r2=259(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=31(x), r6=109(y), r7=74(width), r8=55(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 182
LDI r2, 259
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 109
LDI r7, 74
LDI r8, 55
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
