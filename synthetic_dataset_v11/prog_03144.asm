; DESCRIPTION: Draws a black circle centered at (85, 109) with radius 68.
; PLAN: r0=85(x), r1=109(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 109
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
