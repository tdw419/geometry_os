; DESCRIPTION: Draws a white circle centered at (132, 18) with radius 18.
; PLAN: r0=132(x), r1=18(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 18
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
