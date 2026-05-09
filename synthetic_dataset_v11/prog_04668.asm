; DESCRIPTION: Places a white circle of radius 69 at center (155, 152).
; PLAN: r0=155(x), r1=152(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 152
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
