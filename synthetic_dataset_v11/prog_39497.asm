; DESCRIPTION: Draws a white circle centered at (102, 80) with radius 67.
; PLAN: r0=102(x), r1=80(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 80
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
