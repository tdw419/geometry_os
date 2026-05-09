; DESCRIPTION: Creates a red circular shape at (27, 34) with radius 23.
; PLAN: r0=27(x), r1=34(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 27
LDI r1, 34
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
