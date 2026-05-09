; DESCRIPTION: Composite: . Then Creates a purple circular shape at (193, 121) with radius 35. Then Sets a single black pixel at (155, 145).
; PLAN: r0=193(x), r1=121(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=155(x), r1=145(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a purple circular shape at (193, 121) with radius 35.
; PLAN: r0=193(x), r1=121(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 121
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (155, 145).
; PLAN: r0=155(x), r1=145(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 145
LDI r2, 0x000000
PSET r0, r1, r2
HALT
