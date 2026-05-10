; DESCRIPTION: Places a orange disk with center (206, 156) and radius 38.
; PLAN: r0=206(x), r1=156(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 156
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
