; DESCRIPTION: Creates a black circular shape at (79, 146) with radius 38.
; PLAN: r0=79(x), r1=146(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 146
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
