; DESCRIPTION: Composite: Sets a single red pixel at (42, 109) then Places a purple circle of radius 34 at center (196, 167) then Places a orange line segment connecting (136, 189) to (219, 251).
; PLAN: r0=42(x), r1=109(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=196(x), r6=167(y), r7=34(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=136(x1), r11=189(y1), r12=219(x2), r13=251(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 109
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 196
LDI r6, 167
LDI r7, 34
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 136
LDI r11, 189
LDI r12, 219
LDI r13, 251
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
