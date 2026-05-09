; DESCRIPTION: Composite: Draws a purple rectangle at (430, 199) with width 77 and height 20 then Places a white line segment connecting (102, 153) to (220, 35).
; PLAN: r0=430(x), r1=199(y), r2=77(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=102(x1), r6=153(y1), r7=220(x2), r8=35(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 199
LDI r2, 77
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 153
LDI r7, 220
LDI r8, 35
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
