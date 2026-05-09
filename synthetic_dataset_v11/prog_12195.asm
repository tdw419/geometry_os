; DESCRIPTION: Renders a orange disk with center (138, 149) and radius 20.
; PLAN: r0=138(x), r1=149(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 149
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
