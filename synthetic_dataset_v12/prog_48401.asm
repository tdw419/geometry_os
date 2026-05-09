; DESCRIPTION: Creates a white circular shape at (69, 74) with radius 49.
; PLAN: r0=69(x), r1=74(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 74
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
