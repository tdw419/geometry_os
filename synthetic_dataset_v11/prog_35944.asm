; DESCRIPTION: Draws a white circle centered at (61, 84) with radius 59.
; PLAN: r0=61(x), r1=84(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 84
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
