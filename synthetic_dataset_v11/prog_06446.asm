; DESCRIPTION: Draws a white circle centered at (111, 59) with radius 39.
; PLAN: r0=111(x), r1=59(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 59
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
