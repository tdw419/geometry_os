; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (105, 82) with radius 77. Then Places a black dot at position (173, 37).
; PLAN: r0=105(x), r1=82(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=173(x), r1=37(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a cyan circular shape at (105, 82) with radius 77.
; PLAN: r0=105(x), r1=82(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 82
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (173, 37).
; PLAN: r0=173(x), r1=37(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 173
LDI r1, 37
LDI r2, 0x000000
PSET r0, r1, r2
HALT
