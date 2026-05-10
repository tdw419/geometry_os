; DESCRIPTION: Places a orange circle of radius 65 at center (293, 164).
; PLAN: r0=293(x), r1=164(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 164
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
