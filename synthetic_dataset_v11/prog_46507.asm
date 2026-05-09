; DESCRIPTION: Creates a red circular shape at (168, 31) with radius 22.
; PLAN: r0=168(x), r1=31(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 31
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
