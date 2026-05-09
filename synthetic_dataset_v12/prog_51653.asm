; DESCRIPTION: Draws a red circle centered at (422, 122) with radius 47.
; PLAN: r0=422(x), r1=122(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 122
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
