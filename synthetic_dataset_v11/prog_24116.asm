; DESCRIPTION: Draws a white circle centered at (156, 59) with radius 49.
; PLAN: r0=156(x), r1=59(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 59
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
