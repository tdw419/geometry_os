; DESCRIPTION: Renders a yellow disk with center (262, 88) and radius 74.
; PLAN: r0=262(x), r1=88(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 88
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
