; DESCRIPTION: Creates a red circular shape at (167, 167) with radius 64.
; PLAN: r0=167(x), r1=167(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 167
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
