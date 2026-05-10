; DESCRIPTION: Draws a magenta circle centered at (218, 198) with radius 38.
; PLAN: r0=218(x), r1=198(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 198
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
