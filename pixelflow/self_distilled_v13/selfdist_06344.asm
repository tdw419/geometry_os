; DESCRIPTION: Draws a white circle centered at (80, 194) with radius 17.
; PLAN: r0=80(x), r1=194(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 194
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
