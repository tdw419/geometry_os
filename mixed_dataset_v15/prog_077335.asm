; DESCRIPTION: Draws a white circle centered at (478, 59) with radius 32.
; PLAN: r0=478(x), r1=59(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 478
LDI r1, 59
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
