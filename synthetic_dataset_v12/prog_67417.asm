; DESCRIPTION: Draws a purple circle centered at (171, 133) with radius 57.
; PLAN: r0=171(x), r1=133(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 133
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
