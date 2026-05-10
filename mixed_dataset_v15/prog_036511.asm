; DESCRIPTION: Composite: Renders a magenta disk with center (49, 118) and radius 30 then Sets a single yellow pixel at (282, 211).
; PLAN: r0=49(x), r1=118(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=282(x), r6=211(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 49
LDI r1, 118
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 282
LDI r6, 211
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
