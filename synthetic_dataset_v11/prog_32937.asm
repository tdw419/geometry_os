; DESCRIPTION: Composite: . Then Sets a single blue pixel at (170, 115). Then Creates a orange circular shape at (208, 69) with radius 18.
; PLAN: r0=170(x), r1=115(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=208(x), r1=69(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (170, 115).
; PLAN: r0=170(x), r1=115(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 115
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Creates a orange circular shape at (208, 69) with radius 18.
; PLAN: r0=208(x), r1=69(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 69
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
