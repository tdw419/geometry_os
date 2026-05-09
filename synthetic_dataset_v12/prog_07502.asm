; DESCRIPTION: Draws a yellow circle centered at (61, 133) with radius 48.
; PLAN: r0=61(x), r1=133(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 133
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
