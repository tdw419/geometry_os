; DESCRIPTION: Creates a red circular shape at (140, 121) with radius 50.
; PLAN: r0=140(x), r1=121(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 121
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
