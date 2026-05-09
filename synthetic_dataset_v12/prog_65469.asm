; DESCRIPTION: Draws a white circle centered at (383, 99) with radius 33.
; PLAN: r0=383(x), r1=99(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 99
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
