; DESCRIPTION: Draws a white circle centered at (38, 151) with radius 12.
; PLAN: r0=38(x), r1=151(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 151
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
