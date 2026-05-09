; DESCRIPTION: Creates a white circular shape at (329, 131) with radius 35.
; PLAN: r0=329(x), r1=131(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 131
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
