; DESCRIPTION: Composite: Draws a magenta circle centered at (430, 83) with radius 15 then Draws a black line from (156, 15) to (258, 157).
; PLAN: r0=430(x), r1=83(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x1), r6=15(y1), r7=258(x2), r8=157(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 83
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 15
LDI r7, 258
LDI r8, 157
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
