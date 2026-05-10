; DESCRIPTION: Composite: Renders a black disk with center (97, 167) and radius 19 then Places a magenta dot at position (456, 199).
; PLAN: r0=97(x), r1=167(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x), r6=199(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 97
LDI r1, 167
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 199
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
