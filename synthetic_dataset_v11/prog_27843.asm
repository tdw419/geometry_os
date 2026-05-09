; DESCRIPTION: Creates a green circular shape at (121, 88) with radius 74.
; PLAN: r0=121(x), r1=88(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 88
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
