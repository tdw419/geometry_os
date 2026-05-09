; DESCRIPTION: Composite: Places a black line segment connecting (270, 109) to (227, 62) then Draws a white circle centered at (112, 167) with radius 67.
; PLAN: r0=270(x1), r1=109(y1), r2=227(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=167(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 270
LDI r1, 109
LDI r2, 227
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 167
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
