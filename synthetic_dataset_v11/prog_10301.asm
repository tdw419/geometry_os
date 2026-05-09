; DESCRIPTION: Places a white circle of radius 58 at center (164, 148).
; PLAN: r0=164(x), r1=148(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 148
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
