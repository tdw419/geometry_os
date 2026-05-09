; DESCRIPTION: Draws a white circle centered at (218, 165) with radius 10.
; PLAN: r0=218(x), r1=165(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 165
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
