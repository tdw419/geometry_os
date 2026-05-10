; DESCRIPTION: Places a white circle of radius 18 at center (346, 149).
; PLAN: r0=346(x), r1=149(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 149
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
