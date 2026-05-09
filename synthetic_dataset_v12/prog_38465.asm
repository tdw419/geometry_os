; DESCRIPTION: Draws a red circle centered at (67, 17) with radius 10.
; PLAN: r0=67(x), r1=17(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 17
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
