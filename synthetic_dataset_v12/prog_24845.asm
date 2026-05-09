; DESCRIPTION: Composite: Creates a green rectangular region at (219, 118) spanning 84 by 31 pixels then Draws a black line from (326, 73) to (339, 39).
; PLAN: r0=219(x), r1=118(y), r2=84(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=326(x1), r6=73(y1), r7=339(x2), r8=39(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 219
LDI r1, 118
LDI r2, 84
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 73
LDI r7, 339
LDI r8, 39
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
