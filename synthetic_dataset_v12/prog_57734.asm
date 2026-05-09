; DESCRIPTION: Composite: Places a cyan line segment connecting (395, 40) to (18, 140) then Creates a orange circular shape at (402, 176) with radius 43.
; PLAN: r0=395(x1), r1=40(y1), r2=18(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=176(y), r7=43(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 395
LDI r1, 40
LDI r2, 18
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 176
LDI r7, 43
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
