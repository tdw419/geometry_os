; DESCRIPTION: Draws a red circle centered at (234, 67) with radius 54.
; PLAN: r0=234(x), r1=67(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 67
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
