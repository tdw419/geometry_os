; DESCRIPTION: Draws a red circle centered at (73, 63) with radius 52.
; PLAN: r0=73(x), r1=63(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 63
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
