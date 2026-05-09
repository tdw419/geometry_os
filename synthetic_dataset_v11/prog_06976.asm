; DESCRIPTION: Composite: . Then Creates a purple circular shape at (161, 63) with radius 60. Then Sets a single black pixel at (184, 245).
; PLAN: r0=161(x), r1=63(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=184(x), r1=245(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a purple circular shape at (161, 63) with radius 60.
; PLAN: r0=161(x), r1=63(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 63
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (184, 245).
; PLAN: r0=184(x), r1=245(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 184
LDI r1, 245
LDI r2, 0x000000
PSET r0, r1, r2
HALT
