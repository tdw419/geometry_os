; DESCRIPTION: Renders a orange disk with center (54, 132) and radius 36.
; PLAN: r0=54(x), r1=132(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 132
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
