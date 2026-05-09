; DESCRIPTION: Places a white circle of radius 74 at center (251, 171).
; PLAN: r0=251(x), r1=171(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 171
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
