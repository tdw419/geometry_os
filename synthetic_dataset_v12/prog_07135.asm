; DESCRIPTION: Creates a red circular shape at (338, 149) with radius 71.
; PLAN: r0=338(x), r1=149(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 149
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
