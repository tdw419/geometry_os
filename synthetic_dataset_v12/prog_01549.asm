; DESCRIPTION: Draws a black circle centered at (231, 167) with radius 68.
; PLAN: r0=231(x), r1=167(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 167
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
