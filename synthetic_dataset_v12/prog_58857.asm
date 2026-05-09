; DESCRIPTION: Draws a red circle centered at (81, 119) with radius 63.
; PLAN: r0=81(x), r1=119(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 119
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
