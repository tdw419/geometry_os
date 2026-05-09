; DESCRIPTION: Composite: . Then Sets a single purple pixel at (81, 108). Then Creates a green circular shape at (102, 131) with radius 41.
; PLAN: r0=81(x), r1=108(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=102(x), r1=131(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (81, 108).
; PLAN: r0=81(x), r1=108(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 108
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a green circular shape at (102, 131) with radius 41.
; PLAN: r0=102(x), r1=131(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 131
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
