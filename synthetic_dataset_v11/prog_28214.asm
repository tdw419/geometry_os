; DESCRIPTION: Creates a red circular shape at (189, 164) with radius 29.
; PLAN: r0=189(x), r1=164(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 164
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
