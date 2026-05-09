; DESCRIPTION: Renders a yellow disk with center (74, 55) and radius 34.
; PLAN: r0=74(x), r1=55(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 55
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
