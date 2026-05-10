; DESCRIPTION: Places a white circle of radius 38 at center (355, 92).
; PLAN: r0=355(x), r1=92(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 92
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
