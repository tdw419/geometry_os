; DESCRIPTION: Composite: Renders a blue disk with center (168, 112) and radius 68 then Sets a single red pixel at (253, 104).
; PLAN: r0=168(x), r1=112(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=253(x), r6=104(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 168
LDI r1, 112
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 253
LDI r6, 104
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
