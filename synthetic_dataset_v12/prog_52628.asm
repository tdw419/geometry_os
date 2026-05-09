; DESCRIPTION: Draws a red circle centered at (45, 227) with radius 16.
; PLAN: r0=45(x), r1=227(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 227
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
