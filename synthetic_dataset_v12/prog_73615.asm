; DESCRIPTION: Draws a red circle centered at (411, 134) with radius 63.
; PLAN: r0=411(x), r1=134(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 134
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
