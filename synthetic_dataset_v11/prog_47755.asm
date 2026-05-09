; DESCRIPTION: Draws a white circle centered at (168, 219) with radius 34.
; PLAN: r0=168(x), r1=219(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 219
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
