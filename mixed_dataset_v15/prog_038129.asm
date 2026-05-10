; DESCRIPTION: Places a white circle of radius 37 at center (37, 153).
; PLAN: r0=37(x), r1=153(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 153
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
