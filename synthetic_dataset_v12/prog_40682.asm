; DESCRIPTION: Draws a blue circle centered at (104, 167) with radius 46.
; PLAN: r0=104(x), r1=167(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 167
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
