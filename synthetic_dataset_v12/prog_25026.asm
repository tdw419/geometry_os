; DESCRIPTION: Draws a white circle centered at (256, 178) with radius 35.
; PLAN: r0=256(x), r1=178(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 178
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
