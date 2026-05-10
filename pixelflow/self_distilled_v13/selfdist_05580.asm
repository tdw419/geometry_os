; DESCRIPTION: Places a orange disk with center (22, 163) and radius 59.
; PLAN: r0=22(x), r1=163(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 163
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
