; DESCRIPTION: Draws a white circle centered at (181, 164) with radius 57.
; PLAN: r0=181(x), r1=164(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 164
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
