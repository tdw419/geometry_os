; DESCRIPTION: Renders a magenta disk with center (104, 67) and radius 16.
; PLAN: r0=104(x), r1=67(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 67
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
