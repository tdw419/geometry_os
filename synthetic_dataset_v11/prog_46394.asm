; DESCRIPTION: Composite: . Then Places a black circle of radius 45 at center (129, 137). Then Sets a single white pixel at (127, 30).
; PLAN: r0=129(x), r1=137(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=127(x), r1=30(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black circle of radius 45 at center (129, 137).
; PLAN: r0=129(x), r1=137(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 137
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single white pixel at (127, 30).
; PLAN: r0=127(x), r1=30(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 127
LDI r1, 30
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
