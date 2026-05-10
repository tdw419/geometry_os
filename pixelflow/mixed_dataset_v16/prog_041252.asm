; DESCRIPTION: Renders a yellow circular shape at (381, 200) with radius 67.
; PLAN: r0=381(x), r1=200(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 200
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
