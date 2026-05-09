; DESCRIPTION: Composite: Creates a cyan circular shape at (299, 72) with radius 69 then Places a purple dot at position (45, 30).
; PLAN: r0=299(x), r1=72(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x), r6=30(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 299
LDI r1, 72
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 30
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
