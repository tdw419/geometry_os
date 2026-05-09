; DESCRIPTION: Creates a red circular shape at (105, 180) with radius 73.
; PLAN: r0=105(x), r1=180(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 180
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
