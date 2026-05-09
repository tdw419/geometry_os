; DESCRIPTION: Creates a red circular shape at (133, 61) with radius 16.
; PLAN: r0=133(x), r1=61(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 61
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
