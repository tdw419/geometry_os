; DESCRIPTION: Creates a red circular shape at (266, 187) with radius 33.
; PLAN: r0=266(x), r1=187(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 187
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
