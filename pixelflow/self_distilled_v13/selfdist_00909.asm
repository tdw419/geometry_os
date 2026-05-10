; DESCRIPTION: Draws a white circle centered at (98, 13) with radius 67.
; PLAN: r0=98(x), r1=13(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 13
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
