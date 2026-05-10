; DESCRIPTION: Places a orange circle of radius 38 at center (356, 44).
; PLAN: r0=356(x), r1=44(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 44
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
