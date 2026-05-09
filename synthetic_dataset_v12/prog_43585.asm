; DESCRIPTION: Creates a red circular shape at (256, 110) with radius 71.
; PLAN: r0=256(x), r1=110(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 110
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
