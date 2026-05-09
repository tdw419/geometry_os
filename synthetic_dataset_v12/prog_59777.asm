; DESCRIPTION: Places a yellow circle of radius 10 at center (283, 72).
; PLAN: r0=283(x), r1=72(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 72
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
