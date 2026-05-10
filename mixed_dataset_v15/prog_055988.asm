; DESCRIPTION: Composite: Draws a purple line from (463, 96) to (508, 58) then Creates a white rectangular region at (311, 113) spanning 30 by 108 pixels.
; PLAN: r0=463(x1), r1=96(y1), r2=508(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=113(y), r7=30(width), r8=108(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 463
LDI r1, 96
LDI r2, 508
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 113
LDI r7, 30
LDI r8, 108
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
