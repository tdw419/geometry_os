; DESCRIPTION: Draws a white circle centered at (148, 112) with radius 46.
; PLAN: r0=148(x), r1=112(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 112
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
