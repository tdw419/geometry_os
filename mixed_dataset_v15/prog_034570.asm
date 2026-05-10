; DESCRIPTION: Composite: Places a black line segment connecting (82, 118) to (40, 78) then Draws a purple rectangle at (44, 94) with width 19 and height 66.
; PLAN: r0=82(x1), r1=118(y1), r2=40(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=44(x), r6=94(y), r7=19(width), r8=66(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 118
LDI r2, 40
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 94
LDI r7, 19
LDI r8, 66
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
