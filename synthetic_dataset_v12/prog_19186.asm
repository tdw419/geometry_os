; DESCRIPTION: Draws a black circle centered at (176, 174) with radius 54.
; PLAN: r0=176(x), r1=174(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 174
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
