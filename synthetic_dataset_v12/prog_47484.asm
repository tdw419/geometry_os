; DESCRIPTION: Places a orange circle of radius 18 at center (293, 179).
; PLAN: r0=293(x), r1=179(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 179
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
