; DESCRIPTION: Places a orange circle of radius 19 at center (247, 144).
; PLAN: r0=247(x), r1=144(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 144
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
