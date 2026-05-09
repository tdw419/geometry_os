; DESCRIPTION: Places a orange circle of radius 10 at center (345, 119).
; PLAN: r0=345(x), r1=119(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 119
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
