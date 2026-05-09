; DESCRIPTION: Creates a red circular shape at (236, 73) with radius 45.
; PLAN: r0=236(x), r1=73(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 73
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
