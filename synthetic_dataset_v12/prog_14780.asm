; DESCRIPTION: Draws a purple circle centered at (252, 168) with radius 61.
; PLAN: r0=252(x), r1=168(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 168
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
