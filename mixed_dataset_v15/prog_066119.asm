; DESCRIPTION: Composite: Renders a orange line between points (119, 115) and (498, 70) then Creates a black circular shape at (302, 119) with radius 75.
; PLAN: r0=119(x1), r1=115(y1), r2=498(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=119(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 119
LDI r1, 115
LDI r2, 498
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 119
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
