; DESCRIPTION: Creates a black circular shape at (146, 102) with radius 72.
; PLAN: r0=146(x), r1=102(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 102
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
