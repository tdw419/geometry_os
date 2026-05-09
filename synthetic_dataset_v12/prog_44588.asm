; DESCRIPTION: Composite: Creates a purple circular shape at (436, 217) with radius 32 then Places a white dot at position (134, 128).
; PLAN: r0=436(x), r1=217(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x), r6=128(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 436
LDI r1, 217
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 128
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
