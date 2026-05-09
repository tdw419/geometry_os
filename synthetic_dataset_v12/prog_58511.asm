; DESCRIPTION: Composite: Renders a orange disk with center (70, 171) and radius 69 then Sets a single purple pixel at (336, 238).
; PLAN: r0=70(x), r1=171(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=336(x), r6=238(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 70
LDI r1, 171
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 336
LDI r6, 238
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
