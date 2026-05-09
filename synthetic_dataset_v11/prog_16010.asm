; DESCRIPTION: Draws a black circle centered at (158, 149) with radius 65.
; PLAN: r0=158(x), r1=149(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 149
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
