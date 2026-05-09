; DESCRIPTION: Composite: Draws a magenta circle centered at (472, 77) with radius 22 then Places a yellow dot at position (68, 112) then Places a white line segment connecting (3, 97) to (93, 85).
; PLAN: r0=472(x), r1=77(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=112(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=3(x1), r11=97(y1), r12=93(x2), r13=85(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 472
LDI r1, 77
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 112
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 3
LDI r11, 97
LDI r12, 93
LDI r13, 85
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
