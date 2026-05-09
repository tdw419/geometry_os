; DESCRIPTION: Composite: . Then Sets a single orange pixel at (14, 7). Then Renders a black disk with center (195, 82) and radius 56.
; PLAN: r0=14(x), r1=7(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=195(x), r1=82(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (14, 7).
; PLAN: r0=14(x), r1=7(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 14
LDI r1, 7
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a black disk with center (195, 82) and radius 56.
; PLAN: r0=195(x), r1=82(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 82
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
