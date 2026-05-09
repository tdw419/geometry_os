; DESCRIPTION: Creates a red circular shape at (171, 127) with radius 73.
; PLAN: r0=171(x), r1=127(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 127
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
