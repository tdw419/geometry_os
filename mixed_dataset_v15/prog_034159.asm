; DESCRIPTION: Composite: Places a green line segment connecting (378, 96) to (160, 184) then Draws a yellow circle centered at (227, 132) with radius 66.
; PLAN: r0=378(x1), r1=96(y1), r2=160(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=132(y), r7=66(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 378
LDI r1, 96
LDI r2, 160
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 132
LDI r7, 66
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
