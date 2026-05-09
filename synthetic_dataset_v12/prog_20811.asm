; DESCRIPTION: Creates a red circular shape at (413, 154) with radius 30.
; PLAN: r0=413(x), r1=154(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 154
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
