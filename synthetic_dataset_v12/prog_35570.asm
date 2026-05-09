; DESCRIPTION: Renders a magenta disk with center (234, 94) and radius 62.
; PLAN: r0=234(x), r1=94(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 94
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
