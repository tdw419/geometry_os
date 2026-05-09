; DESCRIPTION: Draws a purple circle centered at (187, 20) with radius 13.
; PLAN: r0=187(x), r1=20(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 20
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
