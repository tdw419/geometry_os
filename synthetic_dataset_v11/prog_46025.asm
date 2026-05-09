; DESCRIPTION: Creates a white circular shape at (168, 140) with radius 77.
; PLAN: r0=168(x), r1=140(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 140
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
