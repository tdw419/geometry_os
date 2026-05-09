; DESCRIPTION: Places a orange circle of radius 48 at center (86, 140).
; PLAN: r0=86(x), r1=140(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 140
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
