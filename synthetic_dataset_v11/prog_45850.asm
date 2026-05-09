; DESCRIPTION: Composite: . Then Creates a black circular shape at (131, 200) with radius 53. Then Places a green dot at position (46, 245).
; PLAN: r0=131(x), r1=200(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=46(x), r1=245(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black circular shape at (131, 200) with radius 53.
; PLAN: r0=131(x), r1=200(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 200
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (46, 245).
; PLAN: r0=46(x), r1=245(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 46
LDI r1, 245
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
