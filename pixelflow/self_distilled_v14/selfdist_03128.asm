; DESCRIPTION: Draws a red circle centered at (377, 65) with radius 52.
; PLAN: r0=377(x), r1=65(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 65
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
