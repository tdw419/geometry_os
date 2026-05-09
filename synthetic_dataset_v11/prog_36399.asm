; DESCRIPTION: Draws a white circle centered at (203, 190) with radius 18.
; PLAN: r0=203(x), r1=190(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 190
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
