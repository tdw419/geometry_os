; DESCRIPTION: Draws a green circle centered at (117, 67) with radius 45.
; PLAN: r0=117(x), r1=67(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 67
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
