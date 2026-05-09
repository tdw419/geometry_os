; DESCRIPTION: Renders a blue disk with center (291, 111) and radius 78.
; PLAN: r0=291(x), r1=111(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 111
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
