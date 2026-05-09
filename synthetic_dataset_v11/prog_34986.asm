; DESCRIPTION: Creates a red circular shape at (51, 207) with radius 21.
; PLAN: r0=51(x), r1=207(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 207
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
