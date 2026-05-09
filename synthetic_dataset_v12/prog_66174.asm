; DESCRIPTION: Places a orange circle of radius 11 at center (165, 21).
; PLAN: r0=165(x), r1=21(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 21
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
