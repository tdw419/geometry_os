; DESCRIPTION: Draws a white circle centered at (117, 86) with radius 59.
; PLAN: r0=117(x), r1=86(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 86
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
