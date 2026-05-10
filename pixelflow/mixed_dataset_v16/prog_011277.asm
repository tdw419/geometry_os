; DESCRIPTION: Composite: Creates a purple circular shape at (302, 126) with radius 76 then Places a purple dot at position (166, 225).
; PLAN: r0=302(x), r1=126(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x), r6=225(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 302
LDI r1, 126
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 225
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
