; DESCRIPTION: Creates a red circular shape at (129, 187) with radius 55.
; PLAN: r0=129(x), r1=187(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 187
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
