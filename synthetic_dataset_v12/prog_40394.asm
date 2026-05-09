; DESCRIPTION: Creates a red circular shape at (291, 69) with radius 51.
; PLAN: r0=291(x), r1=69(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 69
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
