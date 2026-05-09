; DESCRIPTION: Renders a orange disk with center (160, 125) and radius 79.
; PLAN: r0=160(x), r1=125(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 125
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
