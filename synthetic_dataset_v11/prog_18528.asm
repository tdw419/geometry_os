; DESCRIPTION: Draws a purple circle centered at (182, 174) with radius 68.
; PLAN: r0=182(x), r1=174(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 174
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
