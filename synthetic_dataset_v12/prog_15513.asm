; DESCRIPTION: Draws a white circle centered at (56, 150) with radius 39.
; PLAN: r0=56(x), r1=150(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 150
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
