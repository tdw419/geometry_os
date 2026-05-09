; DESCRIPTION: Creates a white circular shape at (70, 80) with radius 60.
; PLAN: r0=70(x), r1=80(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 80
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
