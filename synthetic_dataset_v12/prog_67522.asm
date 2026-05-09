; DESCRIPTION: Places a magenta circle of radius 46 at center (104, 122).
; PLAN: r0=104(x), r1=122(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 122
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
