; DESCRIPTION: Renders a yellow circular shape at (90, 119) with radius 67.
; PLAN: r0=90(x), r1=119(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 119
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
