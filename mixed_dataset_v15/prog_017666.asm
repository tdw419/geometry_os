; DESCRIPTION: Composite: Draws a purple line from (14, 149) to (91, 26) then Draws a blue circle centered at (156, 170) with radius 41.
; PLAN: r0=14(x1), r1=149(y1), r2=91(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=170(y), r7=41(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 14
LDI r1, 149
LDI r2, 91
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 170
LDI r7, 41
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
