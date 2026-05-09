; DESCRIPTION: Renders a orange disk with center (185, 161) and radius 40.
; PLAN: r0=185(x), r1=161(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 161
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
