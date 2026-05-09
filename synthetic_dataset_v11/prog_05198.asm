; DESCRIPTION: Creates a blue circular shape at (38, 117) with radius 31.
; PLAN: r0=38(x), r1=117(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 117
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
