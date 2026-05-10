; DESCRIPTION: Composite: Creates a white rectangular region at (372, 43) spanning 79 by 86 pixels then Renders a purple line between points (49, 67) and (491, 38).
; PLAN: r0=372(x), r1=43(y), r2=79(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x1), r6=67(y1), r7=491(x2), r8=38(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 43
LDI r2, 79
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 67
LDI r7, 491
LDI r8, 38
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
