; DESCRIPTION: Composite: . Then Places a purple dot at position (53, 183). Then Places a cyan circle of radius 20 at center (219, 61).
; PLAN: r0=53(x), r1=183(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=219(x), r1=61(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (53, 183).
; PLAN: r0=53(x), r1=183(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 53
LDI r1, 183
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a cyan circle of radius 20 at center (219, 61).
; PLAN: r0=219(x), r1=61(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 61
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
