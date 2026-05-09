; DESCRIPTION: Draws a purple circle centered at (60, 168) with radius 36.
; PLAN: r0=60(x), r1=168(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 168
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
