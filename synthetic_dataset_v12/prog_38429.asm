; DESCRIPTION: Composite: Places a purple circle of radius 17 at center (141, 40) then Places a white dot at position (295, 227).
; PLAN: r0=141(x), r1=40(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=295(x), r6=227(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 141
LDI r1, 40
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 295
LDI r6, 227
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
