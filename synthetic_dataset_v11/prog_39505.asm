; DESCRIPTION: Draws a white circle centered at (72, 67) with radius 66.
; PLAN: r0=72(x), r1=67(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 67
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
