; DESCRIPTION: Renders a orange disk with center (98, 55) and radius 46.
; PLAN: r0=98(x), r1=55(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 55
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
