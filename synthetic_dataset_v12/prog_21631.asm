; DESCRIPTION: Places a orange circle of radius 22 at center (487, 144).
; PLAN: r0=487(x), r1=144(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 487
LDI r1, 144
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
