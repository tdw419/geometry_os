; DESCRIPTION: Composite: Places a orange line segment connecting (187, 22) to (285, 110) then Draws a purple circle centered at (356, 195) with radius 28.
; PLAN: r0=187(x1), r1=22(y1), r2=285(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=356(x), r6=195(y), r7=28(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 187
LDI r1, 22
LDI r2, 285
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 195
LDI r7, 28
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
