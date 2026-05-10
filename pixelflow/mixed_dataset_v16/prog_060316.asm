; DESCRIPTION: Composite: Creates a orange rectangular region at (84, 92) spanning 22 by 38 pixels then Draws a black line from (251, 239) to (244, 212).
; PLAN: r0=84(x), r1=92(y), r2=22(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=251(x1), r6=239(y1), r7=244(x2), r8=212(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 92
LDI r2, 22
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 239
LDI r7, 244
LDI r8, 212
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
