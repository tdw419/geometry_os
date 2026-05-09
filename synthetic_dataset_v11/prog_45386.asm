; DESCRIPTION: Creates a red circular shape at (182, 64) with radius 18.
; PLAN: r0=182(x), r1=64(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 64
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
