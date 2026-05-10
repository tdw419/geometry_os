; DESCRIPTION: Composite: Places a white circle of radius 30 at center (118, 134) then Places a yellow dot at position (397, 110).
; PLAN: r0=118(x), r1=134(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x), r6=110(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 118
LDI r1, 134
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 110
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
