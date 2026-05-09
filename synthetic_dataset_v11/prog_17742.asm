; DESCRIPTION: Places a white circle of radius 57 at center (79, 199).
; PLAN: r0=79(x), r1=199(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 199
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
