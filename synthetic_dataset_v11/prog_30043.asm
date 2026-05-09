; DESCRIPTION: Places a white circle of radius 78 at center (135, 136).
; PLAN: r0=135(x), r1=136(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 136
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
