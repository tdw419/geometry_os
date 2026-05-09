; DESCRIPTION: Composite: Renders a white disk with center (269, 217) and radius 31 then Places a white dot at position (499, 212).
; PLAN: r0=269(x), r1=217(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=499(x), r6=212(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 269
LDI r1, 217
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 499
LDI r6, 212
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
