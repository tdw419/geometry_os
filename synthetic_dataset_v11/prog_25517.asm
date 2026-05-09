; DESCRIPTION: Renders a magenta disk with center (67, 67) and radius 62.
; PLAN: r0=67(x), r1=67(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 67
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
