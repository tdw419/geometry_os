; DESCRIPTION: Composite: Renders a green line between points (511, 235) and (399, 233) then Creates a orange circular shape at (442, 79) with radius 43.
; PLAN: r0=511(x1), r1=235(y1), r2=399(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=79(y), r7=43(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 511
LDI r1, 235
LDI r2, 399
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 79
LDI r7, 43
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
