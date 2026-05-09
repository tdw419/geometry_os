; DESCRIPTION: Renders a green disk with center (101, 55) and radius 54.
; PLAN: r0=101(x), r1=55(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 55
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
