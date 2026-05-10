; DESCRIPTION: Creates a white circular shape at (329, 133) with radius 70.
; PLAN: r0=329(x), r1=133(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 133
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
