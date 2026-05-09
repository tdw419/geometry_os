; DESCRIPTION: Draws a white circle centered at (86, 175) with radius 59.
; PLAN: r0=86(x), r1=175(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 175
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
