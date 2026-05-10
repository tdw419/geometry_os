; DESCRIPTION: Draws a green circle centered at (366, 67) with radius 54.
; PLAN: r0=366(x), r1=67(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 67
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
