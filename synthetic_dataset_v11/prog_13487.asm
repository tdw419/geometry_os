; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (141, 56) with radius 52. Then Sets a single yellow pixel at (166, 26).
; PLAN: r0=141(x), r1=56(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=166(x), r1=26(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow circle centered at (141, 56) with radius 52.
; PLAN: r0=141(x), r1=56(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 56
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single yellow pixel at (166, 26).
; PLAN: r0=166(x), r1=26(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 26
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
