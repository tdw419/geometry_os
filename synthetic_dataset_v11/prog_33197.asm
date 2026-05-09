; DESCRIPTION: Renders a yellow disk with center (74, 73) and radius 37.
; PLAN: r0=74(x), r1=73(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 73
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
