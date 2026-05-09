; DESCRIPTION: Draws a yellow circle centered at (63, 229) with radius 13.
; PLAN: r0=63(x), r1=229(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 229
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
