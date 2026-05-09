; DESCRIPTION: Creates a black circular shape at (156, 164) with radius 68.
; PLAN: r0=156(x), r1=164(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 164
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
