; DESCRIPTION: Composite: Renders a white disk with center (484, 96) and radius 22 then Places a yellow dot at position (227, 212).
; PLAN: r0=484(x), r1=96(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x), r6=212(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 484
LDI r1, 96
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 212
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
