; DESCRIPTION: Renders a orange disk with center (345, 178) and radius 70.
; PLAN: r0=345(x), r1=178(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 178
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
