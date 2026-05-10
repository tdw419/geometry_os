; DESCRIPTION: Renders a blue circular shape at (273, 67) with radius 39.
; PLAN: r0=273(x), r1=67(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 67
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
