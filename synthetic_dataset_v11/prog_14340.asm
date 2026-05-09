; DESCRIPTION: Creates a red circular shape at (165, 79) with radius 58.
; PLAN: r0=165(x), r1=79(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 79
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
