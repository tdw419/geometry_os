; DESCRIPTION: Creates a red circular shape at (115, 199) with radius 18.
; PLAN: r0=115(x), r1=199(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 199
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
