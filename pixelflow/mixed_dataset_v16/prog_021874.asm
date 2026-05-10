; DESCRIPTION: Renders a orange disk with center (46, 55) and radius 10.
; PLAN: r0=46(x), r1=55(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 55
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
