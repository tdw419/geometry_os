; DESCRIPTION: Composite: Renders a green disk with center (129, 49) and radius 13 then Places a blue dot at position (253, 195).
; PLAN: r0=129(x), r1=49(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=253(x), r6=195(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 129
LDI r1, 49
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 253
LDI r6, 195
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
