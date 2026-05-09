; DESCRIPTION: Renders a magenta disk with center (326, 78) and radius 20.
; PLAN: r0=326(x), r1=78(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 78
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
