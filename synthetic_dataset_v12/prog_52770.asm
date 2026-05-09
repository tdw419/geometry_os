; DESCRIPTION: Draws a orange circle centered at (216, 104) with radius 57.
; PLAN: r0=216(x), r1=104(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 104
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
