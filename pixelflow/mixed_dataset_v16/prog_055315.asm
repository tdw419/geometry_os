; DESCRIPTION: Draws a white circle centered at (135, 164) with radius 69.
; PLAN: r0=135(x), r1=164(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 164
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
