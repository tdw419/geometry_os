; DESCRIPTION: Draws a white circle centered at (442, 101) with radius 13.
; PLAN: r0=442(x), r1=101(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 101
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
