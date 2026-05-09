; DESCRIPTION: Creates a white circular shape at (393, 95) with radius 56.
; PLAN: r0=393(x), r1=95(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 95
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
