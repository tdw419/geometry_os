; DESCRIPTION: Creates a red circular shape at (126, 46) with radius 30.
; PLAN: r0=126(x), r1=46(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 46
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
