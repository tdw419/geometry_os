; DESCRIPTION: Renders a yellow disk with center (210, 85) and radius 47.
; PLAN: r0=210(x), r1=85(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 85
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
