; DESCRIPTION: Places a red circle of radius 77 at center (343, 79).
; PLAN: r0=343(x), r1=79(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 79
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
