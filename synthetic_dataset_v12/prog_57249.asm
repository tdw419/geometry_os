; DESCRIPTION: Renders a orange disk with center (135, 55) and radius 54.
; PLAN: r0=135(x), r1=55(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 55
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
