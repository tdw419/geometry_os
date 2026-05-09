; DESCRIPTION: Places a white circle of radius 63 at center (134, 135).
; PLAN: r0=134(x), r1=135(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 135
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
