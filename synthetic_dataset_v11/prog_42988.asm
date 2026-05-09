; DESCRIPTION: Draws a white circle centered at (203, 146) with radius 21.
; PLAN: r0=203(x), r1=146(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 146
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
