; DESCRIPTION: Composite: Renders a cyan disk with center (172, 176) and radius 71 then Places a yellow dot at position (93, 116).
; PLAN: r0=172(x), r1=176(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x), r6=116(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 172
LDI r1, 176
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 116
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
