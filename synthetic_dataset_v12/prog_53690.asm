; DESCRIPTION: Creates a white circular shape at (108, 132) with radius 22.
; PLAN: r0=108(x), r1=132(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 132
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
