; DESCRIPTION: Creates a red circular shape at (226, 95) with radius 80.
; PLAN: r0=226(x), r1=95(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 95
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
