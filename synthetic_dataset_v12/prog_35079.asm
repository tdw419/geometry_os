; DESCRIPTION: Creates a green circular shape at (293, 114) with radius 77.
; PLAN: r0=293(x), r1=114(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 114
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
