; DESCRIPTION: Composite: Draws a yellow line from (6, 173) to (312, 229) then Creates a orange rectangular region at (443, 14) spanning 14 by 22 pixels then Sets a single white pixel at (165, 40).
; PLAN: r0=6(x1), r1=173(y1), r2=312(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=443(x), r6=14(y), r7=14(width), r8=22(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=165(x), r11=40(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 6
LDI r1, 173
LDI r2, 312
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 14
LDI r7, 14
LDI r8, 22
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 165
LDI r11, 40
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
