; DESCRIPTION: Draws a white circle centered at (59, 97) with radius 49.
; PLAN: r0=59(x), r1=97(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 97
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
