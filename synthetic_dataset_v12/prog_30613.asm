; DESCRIPTION: Draws a blue circle centered at (216, 124) with radius 47.
; PLAN: r0=216(x), r1=124(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 124
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
