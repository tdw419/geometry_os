; DESCRIPTION: Draws a white circle centered at (129, 74) with radius 67.
; PLAN: r0=129(x), r1=74(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 74
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
