; DESCRIPTION: Draws a yellow circle centered at (326, 133) with radius 49.
; PLAN: r0=326(x), r1=133(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 133
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
