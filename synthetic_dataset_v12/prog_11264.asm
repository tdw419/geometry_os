; DESCRIPTION: Composite: Creates a purple circular shape at (273, 30) with radius 14 then Places a blue dot at position (461, 187).
; PLAN: r0=273(x), r1=30(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=461(x), r6=187(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 273
LDI r1, 30
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 461
LDI r6, 187
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
