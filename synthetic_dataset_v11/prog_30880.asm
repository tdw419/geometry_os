; DESCRIPTION: Creates a white circular shape at (202, 210) with radius 34.
; PLAN: r0=202(x), r1=210(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 210
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
