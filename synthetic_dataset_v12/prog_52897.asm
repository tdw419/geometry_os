; DESCRIPTION: Places a orange circle of radius 56 at center (247, 133).
; PLAN: r0=247(x), r1=133(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 133
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
