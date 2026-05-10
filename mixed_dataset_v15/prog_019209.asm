; DESCRIPTION: Creates a white circular shape at (238, 59) with radius 24.
; PLAN: r0=238(x), r1=59(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 59
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
