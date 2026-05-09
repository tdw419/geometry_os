; DESCRIPTION: Composite: Places a purple circle of radius 75 at center (194, 174) then Places a blue dot at position (157, 156).
; PLAN: r0=194(x), r1=174(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x), r6=156(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 194
LDI r1, 174
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 156
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
