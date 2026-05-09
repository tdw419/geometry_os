; DESCRIPTION: Composite: Renders a green disk with center (155, 66) and radius 41 then Sets a single purple pixel at (210, 48).
; PLAN: r0=155(x), r1=66(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=210(x), r6=48(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 155
LDI r1, 66
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 210
LDI r6, 48
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
