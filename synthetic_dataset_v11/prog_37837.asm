; DESCRIPTION: Places a white circle of radius 35 at center (92, 103).
; PLAN: r0=92(x), r1=103(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 103
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
