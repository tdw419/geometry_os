; DESCRIPTION: Draws a black circle centered at (172, 168) with radius 31.
; PLAN: r0=172(x), r1=168(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 168
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
