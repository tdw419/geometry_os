; DESCRIPTION: Renders a yellow disk with center (230, 73) and radius 54.
; PLAN: r0=230(x), r1=73(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 73
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
