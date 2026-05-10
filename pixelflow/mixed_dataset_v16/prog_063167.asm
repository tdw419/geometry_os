; DESCRIPTION: Creates a red circular shape at (160, 116) with radius 71.
; PLAN: r0=160(x), r1=116(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 116
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
