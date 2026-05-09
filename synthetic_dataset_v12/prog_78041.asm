; DESCRIPTION: Renders a orange disk with center (100, 156) and radius 63.
; PLAN: r0=100(x), r1=156(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 156
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
