; DESCRIPTION: Creates a white circular shape at (180, 70) with radius 66.
; PLAN: r0=180(x), r1=70(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 70
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
