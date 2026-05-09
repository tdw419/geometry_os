; DESCRIPTION: Composite: Creates a cyan circular shape at (99, 134) with radius 12 then Places a purple dot at position (258, 120).
; PLAN: r0=99(x), r1=134(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=258(x), r6=120(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 99
LDI r1, 134
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 258
LDI r6, 120
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
