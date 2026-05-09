; DESCRIPTION: Draws a white circle centered at (148, 70) with radius 64.
; PLAN: r0=148(x), r1=70(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 70
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
