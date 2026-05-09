; DESCRIPTION: Creates a red circular shape at (421, 133) with radius 46.
; PLAN: r0=421(x), r1=133(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 133
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
