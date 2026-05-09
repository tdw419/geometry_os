; DESCRIPTION: Creates a white circular shape at (234, 180) with radius 38.
; PLAN: r0=234(x), r1=180(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 180
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
