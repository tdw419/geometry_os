; DESCRIPTION: Places a white circle of radius 73 at center (333, 163).
; PLAN: r0=333(x), r1=163(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 163
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
