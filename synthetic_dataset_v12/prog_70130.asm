; DESCRIPTION: Creates a red circular shape at (154, 122) with radius 76.
; PLAN: r0=154(x), r1=122(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 122
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
