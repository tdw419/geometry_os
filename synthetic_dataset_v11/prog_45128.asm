; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (113, 140) with radius 79. Then Sets a single black pixel at (172, 15).
; PLAN: r0=113(x), r1=140(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=172(x), r1=15(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow circular shape at (113, 140) with radius 79.
; PLAN: r0=113(x), r1=140(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 140
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (172, 15).
; PLAN: r0=172(x), r1=15(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 15
LDI r2, 0x000000
PSET r0, r1, r2
HALT
