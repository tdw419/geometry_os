; DESCRIPTION: Composite: Draws a red circle centered at (139, 195) with radius 38 then Sets a single blue pixel at (507, 196).
; PLAN: r0=139(x), r1=195(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=507(x), r6=196(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 139
LDI r1, 195
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 507
LDI r6, 196
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
