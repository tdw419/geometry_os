; DESCRIPTION: Places a orange circle of radius 66 at center (333, 136).
; PLAN: r0=333(x), r1=136(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 136
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
