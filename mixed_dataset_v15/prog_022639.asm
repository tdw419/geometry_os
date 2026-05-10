; DESCRIPTION: Composite: Places a purple dot at position (30, 195) then Places a white circle of radius 76 at center (241, 136).
; PLAN: r0=30(x), r1=195(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=136(y), r7=76(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 30
LDI r1, 195
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 241
LDI r6, 136
LDI r7, 76
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
