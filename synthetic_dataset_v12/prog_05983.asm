; DESCRIPTION: Renders a black disk with center (243, 75) and radius 54.
; PLAN: r0=243(x), r1=75(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 75
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
