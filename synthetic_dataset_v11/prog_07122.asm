; DESCRIPTION: Creates a red circular shape at (168, 73) with radius 69.
; PLAN: r0=168(x), r1=73(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 73
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
