; DESCRIPTION: Creates a white circular shape at (176, 162) with radius 79.
; PLAN: r0=176(x), r1=162(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 162
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
