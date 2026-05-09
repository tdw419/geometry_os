; DESCRIPTION: Composite: Creates a black rectangular region at (40, 62) spanning 118 by 113 pixels then Renders a orange line between points (167, 251) and (505, 222).
; PLAN: r0=40(x), r1=62(y), r2=118(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=167(x1), r6=251(y1), r7=505(x2), r8=222(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 40
LDI r1, 62
LDI r2, 118
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 251
LDI r7, 505
LDI r8, 222
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
