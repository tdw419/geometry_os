; DESCRIPTION: Draws a white circle centered at (81, 164) with radius 50.
; PLAN: r0=81(x), r1=164(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 164
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
