; DESCRIPTION: Composite: Creates a orange circular shape at (183, 161) with radius 67 then Sets a single black pixel at (87, 97).
; PLAN: r0=183(x), r1=161(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=97(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 183
LDI r1, 161
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 97
LDI r7, 0x000000
PSET r5, r6, r7
HALT
