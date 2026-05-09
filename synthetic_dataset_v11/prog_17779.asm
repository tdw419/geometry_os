; DESCRIPTION: Draws a white circle centered at (214, 80) with radius 39.
; PLAN: r0=214(x), r1=80(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 80
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
