; DESCRIPTION: Draws a white circle centered at (254, 82) with radius 16.
; PLAN: r0=254(x), r1=82(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 82
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
