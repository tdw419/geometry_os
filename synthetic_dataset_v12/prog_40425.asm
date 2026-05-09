; DESCRIPTION: Composite: Renders a black line between points (100, 123) and (311, 77) then Creates a magenta circular shape at (270, 93) with radius 71.
; PLAN: r0=100(x1), r1=123(y1), r2=311(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=93(y), r7=71(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 100
LDI r1, 123
LDI r2, 311
LDI r3, 77
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 93
LDI r7, 71
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
