; DESCRIPTION: Draws a purple circle centered at (202, 4) with radius 14.
; PLAN: r0=202(x), r1=4(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 4
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
