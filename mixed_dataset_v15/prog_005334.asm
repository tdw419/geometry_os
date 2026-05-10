; DESCRIPTION: Creates a white circular shape at (39, 114) with radius 16.
; PLAN: r0=39(x), r1=114(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 114
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
