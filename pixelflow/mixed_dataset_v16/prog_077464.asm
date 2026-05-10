; DESCRIPTION: Places a white circle of radius 13 at center (148, 92).
; PLAN: r0=148(x), r1=92(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 92
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
