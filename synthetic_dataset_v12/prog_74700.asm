; DESCRIPTION: Draws a orange circle centered at (345, 141) with radius 68.
; PLAN: r0=345(x), r1=141(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 141
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
