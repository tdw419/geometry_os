; DESCRIPTION: Draws a white circle centered at (151, 199) with radius 56.
; PLAN: r0=151(x), r1=199(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 199
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
