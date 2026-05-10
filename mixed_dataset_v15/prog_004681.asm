; DESCRIPTION: Places a white circle of radius 50 at center (244, 179).
; PLAN: r0=244(x), r1=179(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 179
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
