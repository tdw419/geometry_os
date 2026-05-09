; DESCRIPTION: Composite: . Then Creates a white circular shape at (132, 100) with radius 11. Then Places a orange dot at position (199, 79).
; PLAN: r0=132(x), r1=100(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=199(x), r1=79(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white circular shape at (132, 100) with radius 11.
; PLAN: r0=132(x), r1=100(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 100
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange dot at position (199, 79).
; PLAN: r0=199(x), r1=79(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 199
LDI r1, 79
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
