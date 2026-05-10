; DESCRIPTION: Composite: Places a white line segment connecting (282, 106) to (356, 41) then Draws a purple circle centered at (101, 102) with radius 66 then Places a blue dot at position (421, 179).
; PLAN: r0=282(x1), r1=106(y1), r2=356(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=101(x), r6=102(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=421(x), r11=179(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 282
LDI r1, 106
LDI r2, 356
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 102
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 421
LDI r11, 179
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
