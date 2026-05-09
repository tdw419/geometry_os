; DESCRIPTION: Composite: Creates a red circular shape at (191, 188) with radius 30 then Sets a single blue pixel at (213, 0).
; PLAN: r0=191(x), r1=188(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=213(x), r6=0(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 191
LDI r1, 188
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 213
LDI r6, 0
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
