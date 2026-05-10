; DESCRIPTION: Composite: Renders a red disk with center (357, 105) and radius 44 then Places a cyan dot at position (194, 130).
; PLAN: r0=357(x), r1=105(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=130(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 357
LDI r1, 105
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 130
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
