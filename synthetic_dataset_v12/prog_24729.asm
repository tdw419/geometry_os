; DESCRIPTION: Composite: Renders a yellow line between points (283, 77) and (462, 132) then Places a red circle of radius 11 at center (496, 219) then Places a purple dot at position (399, 177).
; PLAN: r0=283(x1), r1=77(y1), r2=462(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=496(x), r6=219(y), r7=11(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=399(x), r11=177(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 283
LDI r1, 77
LDI r2, 462
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 219
LDI r7, 11
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 399
LDI r11, 177
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
