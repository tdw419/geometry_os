; DESCRIPTION: Draws a magenta circle centered at (387, 169) with radius 10.
; PLAN: r0=387(x), r1=169(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 169
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
