; DESCRIPTION: Renders a magenta disk with center (67, 107) and radius 22.
; PLAN: r0=67(x), r1=107(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 107
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
