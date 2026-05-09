; DESCRIPTION: Creates a red circular shape at (95, 163) with radius 46.
; PLAN: r0=95(x), r1=163(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 163
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
