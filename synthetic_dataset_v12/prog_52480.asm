; DESCRIPTION: Places a white circle of radius 65 at center (113, 89).
; PLAN: r0=113(x), r1=89(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 89
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
