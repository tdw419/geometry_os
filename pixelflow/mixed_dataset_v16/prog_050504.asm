; DESCRIPTION: Draws a white circle centered at (116, 174) with radius 10.
; PLAN: r0=116(x), r1=174(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 174
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
