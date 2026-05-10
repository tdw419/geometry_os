; DESCRIPTION: Renders a magenta disk with center (320, 75) and radius 67.
; PLAN: r0=320(x), r1=75(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 75
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
