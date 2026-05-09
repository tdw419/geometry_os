; DESCRIPTION: Creates a red circular shape at (240, 64) with radius 34.
; PLAN: r0=240(x), r1=64(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 64
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
