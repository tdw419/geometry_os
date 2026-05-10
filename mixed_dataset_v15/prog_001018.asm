; DESCRIPTION: Renders a blue disk with center (72, 113) and radius 57.
; PLAN: r0=72(x), r1=113(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 113
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
