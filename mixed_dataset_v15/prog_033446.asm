; DESCRIPTION: Places a white circle of radius 69 at center (431, 169).
; PLAN: r0=431(x), r1=169(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 169
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
