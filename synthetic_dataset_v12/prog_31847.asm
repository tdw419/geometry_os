; DESCRIPTION: Creates a green circular shape at (121, 79) with radius 54.
; PLAN: r0=121(x), r1=79(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 79
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
