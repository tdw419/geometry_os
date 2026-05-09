; DESCRIPTION: Creates a red circular shape at (385, 95) with radius 73.
; PLAN: r0=385(x), r1=95(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 95
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
