; DESCRIPTION: Draws a white circle centered at (197, 88) with radius 70.
; PLAN: r0=197(x), r1=88(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 88
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
