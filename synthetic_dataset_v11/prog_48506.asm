; DESCRIPTION: Composite: . Then Places a purple dot at position (12, 26). Then Creates a blue circular shape at (83, 100) with radius 62.
; PLAN: r0=12(x), r1=26(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=83(x), r1=100(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (12, 26).
; PLAN: r0=12(x), r1=26(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 26
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a blue circular shape at (83, 100) with radius 62.
; PLAN: r0=83(x), r1=100(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 100
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
