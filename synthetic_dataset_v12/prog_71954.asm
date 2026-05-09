; DESCRIPTION: Creates a red circular shape at (356, 184) with radius 52.
; PLAN: r0=356(x), r1=184(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 184
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
