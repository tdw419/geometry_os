; DESCRIPTION: Creates a red circular shape at (133, 112) with radius 68.
; PLAN: r0=133(x), r1=112(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 112
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
