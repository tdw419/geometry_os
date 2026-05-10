; DESCRIPTION: Renders a magenta disk with center (409, 98) and radius 30.
; PLAN: r0=409(x), r1=98(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 98
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
