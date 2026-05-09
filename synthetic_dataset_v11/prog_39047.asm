; DESCRIPTION: Renders a orange disk with center (54, 145) and radius 52.
; PLAN: r0=54(x), r1=145(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 145
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
