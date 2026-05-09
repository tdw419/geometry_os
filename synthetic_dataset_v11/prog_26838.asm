; DESCRIPTION: Draws a white circle centered at (81, 48) with radius 17.
; PLAN: r0=81(x), r1=48(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 48
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
