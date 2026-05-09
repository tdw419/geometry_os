; DESCRIPTION: Composite: Sets a single red pixel at (292, 106) then Renders a purple disk with center (55, 178) and radius 29.
; PLAN: r0=292(x), r1=106(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=55(x), r6=178(y), r7=29(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 292
LDI r1, 106
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 55
LDI r6, 178
LDI r7, 29
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
