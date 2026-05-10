; DESCRIPTION: Places a orange disk with center (153, 156) and radius 23.
; PLAN: r0=153(x), r1=156(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 156
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
