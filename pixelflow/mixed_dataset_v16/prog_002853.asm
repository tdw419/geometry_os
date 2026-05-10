; DESCRIPTION: Creates a white circular shape at (110, 95) with radius 60.
; PLAN: r0=110(x), r1=95(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 95
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
