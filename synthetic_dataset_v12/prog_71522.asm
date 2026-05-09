; DESCRIPTION: Composite: Renders a red disk with center (226, 157) and radius 78 then Places a yellow dot at position (334, 161).
; PLAN: r0=226(x), r1=157(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x), r6=161(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 226
LDI r1, 157
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 161
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
