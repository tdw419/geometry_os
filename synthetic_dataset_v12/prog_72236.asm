; DESCRIPTION: Composite: Creates a yellow circular shape at (279, 55) with radius 14 then Places a white dot at position (487, 129).
; PLAN: r0=279(x), r1=55(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=487(x), r6=129(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 279
LDI r1, 55
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 487
LDI r6, 129
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
