; DESCRIPTION: Places a white circle of radius 79 at center (82, 162).
; PLAN: r0=82(x), r1=162(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 162
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
