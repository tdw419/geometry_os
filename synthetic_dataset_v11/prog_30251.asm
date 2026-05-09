; DESCRIPTION: Places a white circle of radius 79 at center (169, 79).
; PLAN: r0=169(x), r1=79(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 79
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
