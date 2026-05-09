; DESCRIPTION: Draws a white circle centered at (332, 178) with radius 59.
; PLAN: r0=332(x), r1=178(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 178
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
