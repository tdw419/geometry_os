; DESCRIPTION: Renders a blue disk with center (39, 165) and radius 36.
; PLAN: r0=39(x), r1=165(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 165
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
