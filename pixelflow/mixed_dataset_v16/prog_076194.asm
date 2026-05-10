; DESCRIPTION: Places a yellow circle of radius 63 at center (78, 109).
; PLAN: r0=78(x), r1=109(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 109
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
