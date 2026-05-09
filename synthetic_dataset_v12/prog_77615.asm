; DESCRIPTION: Composite: Renders a orange line between points (80, 226) and (102, 45) then Creates a red circular shape at (93, 163) with radius 75.
; PLAN: r0=80(x1), r1=226(y1), r2=102(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=163(y), r7=75(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 80
LDI r1, 226
LDI r2, 102
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 163
LDI r7, 75
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
