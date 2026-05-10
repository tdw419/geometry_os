; DESCRIPTION: Composite: Renders a black line between points (369, 145) and (511, 145) then Creates a purple circular shape at (159, 164) with radius 64.
; PLAN: r0=369(x1), r1=145(y1), r2=511(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=164(y), r7=64(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 369
LDI r1, 145
LDI r2, 511
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 164
LDI r7, 64
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
