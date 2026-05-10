; DESCRIPTION: Draws a red circle centered at (145, 154) with radius 63.
; PLAN: r0=145(x), r1=154(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 154
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
