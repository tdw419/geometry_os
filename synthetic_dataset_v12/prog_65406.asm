; DESCRIPTION: Renders a orange disk with center (188, 65) and radius 46.
; PLAN: r0=188(x), r1=65(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 65
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
