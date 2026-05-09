; DESCRIPTION: Renders a orange disk with center (395, 108) and radius 26.
; PLAN: r0=395(x), r1=108(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 108
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
