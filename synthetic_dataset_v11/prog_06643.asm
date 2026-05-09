; DESCRIPTION: Renders a yellow disk with center (98, 135) and radius 25.
; PLAN: r0=98(x), r1=135(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 135
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
