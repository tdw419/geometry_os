; DESCRIPTION: Creates a red circular shape at (24, 194) with radius 19.
; PLAN: r0=24(x), r1=194(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 194
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
