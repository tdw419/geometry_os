; DESCRIPTION: Composite: Creates a orange rectangular region at (105, 5) spanning 110 by 70 pixels then Draws a cyan line from (149, 130) to (396, 206).
; PLAN: r0=105(x), r1=5(y), r2=110(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x1), r6=130(y1), r7=396(x2), r8=206(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 105
LDI r1, 5
LDI r2, 110
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 130
LDI r7, 396
LDI r8, 206
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
