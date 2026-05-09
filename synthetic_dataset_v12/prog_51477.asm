; DESCRIPTION: Draws a yellow circle centered at (404, 175) with radius 63.
; PLAN: r0=404(x), r1=175(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 175
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
