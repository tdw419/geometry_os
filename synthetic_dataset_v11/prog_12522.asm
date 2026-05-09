; DESCRIPTION: Places a white circle of radius 69 at center (138, 132).
; PLAN: r0=138(x), r1=132(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 132
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
