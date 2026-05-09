; DESCRIPTION: Composite: Renders a blue box of size 20x70 starting at (484, 62) then Renders a orange line between points (315, 5) and (447, 175).
; PLAN: r0=484(x), r1=62(y), r2=20(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x1), r6=5(y1), r7=447(x2), r8=175(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 484
LDI r1, 62
LDI r2, 20
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 5
LDI r7, 447
LDI r8, 175
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
