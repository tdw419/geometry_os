; DESCRIPTION: Draws a white circle centered at (184, 46) with radius 30.
; PLAN: r0=184(x), r1=46(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 46
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
