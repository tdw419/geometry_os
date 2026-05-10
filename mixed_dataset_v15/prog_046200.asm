; DESCRIPTION: Composite: Draws a white circle centered at (330, 81) with radius 45 then Places a yellow dot at position (409, 137).
; PLAN: r0=330(x), r1=81(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=137(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 330
LDI r1, 81
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 137
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
