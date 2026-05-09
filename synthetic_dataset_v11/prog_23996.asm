; DESCRIPTION: Draws a white circle centered at (56, 27) with radius 26.
; PLAN: r0=56(x), r1=27(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 27
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
