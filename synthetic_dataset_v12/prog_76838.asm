; DESCRIPTION: Places a white circle of radius 15 at center (178, 188).
; PLAN: r0=178(x), r1=188(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 188
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
