; DESCRIPTION: Draws a orange circle centered at (234, 121) with radius 68.
; PLAN: r0=234(x), r1=121(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 121
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
