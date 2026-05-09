; DESCRIPTION: Renders a orange disk with center (68, 160) and radius 23.
; PLAN: r0=68(x), r1=160(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 160
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
