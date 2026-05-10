; DESCRIPTION: Renders a blue circular shape at (5, 25) with radius 67.
; PLAN: r0=5(x), r1=25(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 5
LDI r1, 25
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
