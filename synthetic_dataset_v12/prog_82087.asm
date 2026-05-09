; DESCRIPTION: Places a white circle of radius 72 at center (336, 108).
; PLAN: r0=336(x), r1=108(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 108
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
