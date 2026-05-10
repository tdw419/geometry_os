; DESCRIPTION: Draws a yellow circle centered at (300, 133) with radius 26.
; PLAN: r0=300(x), r1=133(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 133
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
