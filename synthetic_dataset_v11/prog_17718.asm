; DESCRIPTION: Renders a blue disk with center (25, 210) and radius 17.
; PLAN: r0=25(x), r1=210(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 210
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
