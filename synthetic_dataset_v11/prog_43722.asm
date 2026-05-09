; DESCRIPTION: Composite: . Then Sets a single orange pixel at (59, 119). Then Renders a black disk with center (173, 87) and radius 79.
; PLAN: r0=59(x), r1=119(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=173(x), r1=87(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (59, 119).
; PLAN: r0=59(x), r1=119(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 59
LDI r1, 119
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a black disk with center (173, 87) and radius 79.
; PLAN: r0=173(x), r1=87(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 87
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
