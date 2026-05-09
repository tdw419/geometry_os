; DESCRIPTION: Renders a magenta disk with center (72, 157) and radius 39.
; PLAN: r0=72(x), r1=157(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 157
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
