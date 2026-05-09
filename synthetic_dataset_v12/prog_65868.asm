; DESCRIPTION: Renders a yellow disk with center (262, 36) and radius 29.
; PLAN: r0=262(x), r1=36(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 36
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
