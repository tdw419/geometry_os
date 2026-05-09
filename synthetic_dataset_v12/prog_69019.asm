; DESCRIPTION: Creates a red circular shape at (299, 154) with radius 44.
; PLAN: r0=299(x), r1=154(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 154
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
