; DESCRIPTION: Draws a white circle centered at (29, 59) with radius 29.
; PLAN: r0=29(x), r1=59(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 29
LDI r1, 59
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
