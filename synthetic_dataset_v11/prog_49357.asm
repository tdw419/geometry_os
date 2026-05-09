; DESCRIPTION: Composite: . Then Creates a black circular shape at (159, 127) with radius 62. Then Places a orange dot at position (115, 26).
; PLAN: r0=159(x), r1=127(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=115(x), r1=26(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black circular shape at (159, 127) with radius 62.
; PLAN: r0=159(x), r1=127(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 127
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange dot at position (115, 26).
; PLAN: r0=115(x), r1=26(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 115
LDI r1, 26
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
