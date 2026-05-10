; DESCRIPTION: Draws a purple circle centered at (21, 197) with radius 80.
; PLAN: r0=21(x), r1=197(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 21
LDI r1, 197
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
