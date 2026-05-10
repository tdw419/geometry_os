; DESCRIPTION: Composite: Creates a green circular shape at (100, 113) with radius 41 then Renders a black line between points (319, 254) and (89, 189).
; PLAN: r0=100(x), r1=113(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=319(x1), r6=254(y1), r7=89(x2), r8=189(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 113
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 319
LDI r6, 254
LDI r7, 89
LDI r8, 189
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
