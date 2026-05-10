; DESCRIPTION: Creates a red circular shape at (223, 134) with radius 79.
; PLAN: r0=223(x), r1=134(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 134
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
