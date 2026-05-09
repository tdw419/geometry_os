; DESCRIPTION: Composite: . Then Places a orange dot at position (236, 77). Then Creates a white circular shape at (133, 74) with radius 17.
; PLAN: r0=236(x), r1=77(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=133(x), r1=74(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (236, 77).
; PLAN: r0=236(x), r1=77(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 77
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Creates a white circular shape at (133, 74) with radius 17.
; PLAN: r0=133(x), r1=74(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 74
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
