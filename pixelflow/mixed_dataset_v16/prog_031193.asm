; DESCRIPTION: Composite: Creates a purple rectangular region at (125, 24) spanning 78 by 110 pixels then Places a orange line segment connecting (356, 18) to (140, 19).
; PLAN: r0=125(x), r1=24(y), r2=78(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x1), r6=18(y1), r7=140(x2), r8=19(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 24
LDI r2, 78
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 18
LDI r7, 140
LDI r8, 19
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
