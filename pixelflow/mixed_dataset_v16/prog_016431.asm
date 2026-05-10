; DESCRIPTION: Draws a white circle centered at (57, 126) with radius 15.
; PLAN: r0=57(x), r1=126(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 126
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
