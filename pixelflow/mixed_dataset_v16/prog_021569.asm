; DESCRIPTION: Composite: Places a green line segment connecting (96, 188) to (31, 185) then Creates a black circular shape at (358, 160) with radius 75 then Places a black dot at position (29, 80).
; PLAN: r0=96(x1), r1=188(y1), r2=31(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=160(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=29(x), r11=80(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 96
LDI r1, 188
LDI r2, 31
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 160
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 29
LDI r11, 80
LDI r12, 0x000000
PSET r10, r11, r12
HALT
