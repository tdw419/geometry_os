; DESCRIPTION: Draws a white circle centered at (418, 164) with radius 36.
; PLAN: r0=418(x), r1=164(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 164
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
