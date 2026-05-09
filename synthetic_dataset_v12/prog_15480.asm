; DESCRIPTION: Draws a purple circle centered at (255, 80) with radius 74.
; PLAN: r0=255(x), r1=80(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 80
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
