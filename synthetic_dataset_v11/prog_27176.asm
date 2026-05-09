; DESCRIPTION: Composite: . Then Sets a single black pixel at (98, 220). Then Places a magenta circle of radius 17 at center (203, 32).
; PLAN: r0=98(x), r1=220(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=203(x), r1=32(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (98, 220).
; PLAN: r0=98(x), r1=220(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 98
LDI r1, 220
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a magenta circle of radius 17 at center (203, 32).
; PLAN: r0=203(x), r1=32(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 32
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
