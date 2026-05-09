; DESCRIPTION: Creates a white circular shape at (383, 38) with radius 28.
; PLAN: r0=383(x), r1=38(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 38
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
