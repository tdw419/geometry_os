; DESCRIPTION: Composite: Places a orange line segment connecting (145, 222) to (334, 76) then Places a red dot at position (423, 190) then Creates a cyan rectangular region at (158, 78) spanning 11 by 64 pixels.
; PLAN: r0=145(x1), r1=222(y1), r2=334(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=190(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=158(x), r11=78(y), r12=11(width), r13=64(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 222
LDI r2, 334
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 190
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 158
LDI r11, 78
LDI r12, 11
LDI r13, 64
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
