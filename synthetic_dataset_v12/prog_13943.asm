; DESCRIPTION: Composite: Sets a single blue pixel at (436, 183) then Places a yellow line segment connecting (337, 160) to (77, 54) then Creates a black circular shape at (184, 79) with radius 67.
; PLAN: r0=436(x), r1=183(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=337(x1), r6=160(y1), r7=77(x2), r8=54(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=184(x), r11=79(y), r12=67(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 436
LDI r1, 183
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 337
LDI r6, 160
LDI r7, 77
LDI r8, 54
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 79
LDI r12, 67
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
