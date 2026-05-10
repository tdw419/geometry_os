; DESCRIPTION: Composite: Creates a red circular shape at (239, 171) with radius 65 then Places a purple dot at position (76, 130).
; PLAN: r0=239(x), r1=171(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=76(x), r6=130(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 239
LDI r1, 171
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 76
LDI r6, 130
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
