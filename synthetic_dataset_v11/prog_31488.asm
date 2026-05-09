; DESCRIPTION: Renders a blue disk with center (81, 214) and radius 39.
; PLAN: r0=81(x), r1=214(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 214
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
