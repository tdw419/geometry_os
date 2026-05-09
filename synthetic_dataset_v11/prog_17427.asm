; DESCRIPTION: Creates a orange circular shape at (121, 112) with radius 77.
; PLAN: r0=121(x), r1=112(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 112
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
