; DESCRIPTION: Renders a magenta disk with center (76, 196) and radius 43.
; PLAN: r0=76(x), r1=196(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 196
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
