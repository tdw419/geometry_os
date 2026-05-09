; DESCRIPTION: Draws a purple circle centered at (180, 109) with radius 80.
; PLAN: r0=180(x), r1=109(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 109
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
