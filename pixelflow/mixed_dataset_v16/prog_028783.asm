; DESCRIPTION: Composite: Places a purple line segment connecting (83, 144) to (35, 251) then Draws a purple rectangle at (483, 153) with width 23 and height 66.
; PLAN: r0=83(x1), r1=144(y1), r2=35(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=483(x), r6=153(y), r7=23(width), r8=66(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 83
LDI r1, 144
LDI r2, 35
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 153
LDI r7, 23
LDI r8, 66
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
