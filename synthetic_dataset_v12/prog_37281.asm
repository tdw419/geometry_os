; DESCRIPTION: Places a white circle of radius 79 at center (160, 106).
; PLAN: r0=160(x), r1=106(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 106
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
