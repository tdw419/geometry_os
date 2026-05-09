; DESCRIPTION: Draws a red circle centered at (67, 131) with radius 30.
; PLAN: r0=67(x), r1=131(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 131
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
