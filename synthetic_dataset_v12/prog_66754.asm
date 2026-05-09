; DESCRIPTION: Creates a red circular shape at (32, 140) with radius 31.
; PLAN: r0=32(x), r1=140(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 140
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
