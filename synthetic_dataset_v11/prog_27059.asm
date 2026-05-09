; DESCRIPTION: Draws a red circle centered at (137, 149) with radius 79.
; PLAN: r0=137(x), r1=149(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 149
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
