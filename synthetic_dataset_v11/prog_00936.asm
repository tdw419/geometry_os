; DESCRIPTION: Renders a orange disk with center (84, 178) and radius 49.
; PLAN: r0=84(x), r1=178(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 178
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
