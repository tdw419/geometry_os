; DESCRIPTION: Composite: Creates a green circular shape at (302, 140) with radius 72 then Places a black line segment connecting (200, 110) to (265, 179).
; PLAN: r0=302(x), r1=140(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=200(x1), r6=110(y1), r7=265(x2), r8=179(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 302
LDI r1, 140
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 200
LDI r6, 110
LDI r7, 265
LDI r8, 179
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
