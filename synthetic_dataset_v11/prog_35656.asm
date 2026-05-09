; DESCRIPTION: Draws a white circle centered at (178, 176) with radius 58.
; PLAN: r0=178(x), r1=176(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 176
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
