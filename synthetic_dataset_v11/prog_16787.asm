; DESCRIPTION: Draws a orange circle centered at (164, 121) with radius 67.
; PLAN: r0=164(x), r1=121(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 121
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
