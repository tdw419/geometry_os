; DESCRIPTION: Composite: Renders a yellow line between points (451, 71) and (56, 217) then Creates a orange circular shape at (167, 112) with radius 69.
; PLAN: r0=451(x1), r1=71(y1), r2=56(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=167(x), r6=112(y), r7=69(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 451
LDI r1, 71
LDI r2, 56
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 112
LDI r7, 69
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
