; DESCRIPTION: Renders a magenta disk with center (256, 101) and radius 45.
; PLAN: r0=256(x), r1=101(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 101
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
