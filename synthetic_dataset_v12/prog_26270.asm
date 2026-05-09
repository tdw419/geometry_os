; DESCRIPTION: Composite: Sets a single yellow pixel at (227, 177) then Renders a black disk with center (111, 109) and radius 68.
; PLAN: r0=227(x), r1=177(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=111(x), r6=109(y), r7=68(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 227
LDI r1, 177
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 111
LDI r6, 109
LDI r7, 68
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
