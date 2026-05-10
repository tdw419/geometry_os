; DESCRIPTION: Draws a red circle centered at (362, 169) with radius 24.
; PLAN: r0=362(x), r1=169(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 169
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
