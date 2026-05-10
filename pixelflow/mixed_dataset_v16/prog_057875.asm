; DESCRIPTION: Draws a white circle centered at (434, 67) with radius 15.
; PLAN: r0=434(x), r1=67(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 67
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
