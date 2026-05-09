; DESCRIPTION: Renders a yellow disk with center (52, 135) and radius 20.
; PLAN: r0=52(x), r1=135(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 135
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
