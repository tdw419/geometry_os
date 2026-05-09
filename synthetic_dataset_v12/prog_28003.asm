; DESCRIPTION: Composite: Creates a purple rectangular region at (296, 20) spanning 24 by 18 pixels then Draws a white line from (29, 157) to (142, 55).
; PLAN: r0=296(x), r1=20(y), r2=24(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=29(x1), r6=157(y1), r7=142(x2), r8=55(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 20
LDI r2, 24
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 157
LDI r7, 142
LDI r8, 55
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
