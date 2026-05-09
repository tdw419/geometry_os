; DESCRIPTION: Composite: . Then Places a purple dot at position (131, 100). Then Places a cyan circle of radius 45 at center (107, 89).
; PLAN: r0=131(x), r1=100(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=107(x), r1=89(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (131, 100).
; PLAN: r0=131(x), r1=100(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 100
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a cyan circle of radius 45 at center (107, 89).
; PLAN: r0=107(x), r1=89(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 89
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
