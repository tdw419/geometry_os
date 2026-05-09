; DESCRIPTION: Creates a white circular shape at (394, 162) with radius 39.
; PLAN: r0=394(x), r1=162(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 162
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
