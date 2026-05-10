; DESCRIPTION: Composite: Sets a single white pixel at (125, 136) then Places a white circle of radius 15 at center (288, 122).
; PLAN: r0=125(x), r1=136(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=288(x), r6=122(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 125
LDI r1, 136
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 288
LDI r6, 122
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
