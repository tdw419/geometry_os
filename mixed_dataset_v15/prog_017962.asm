; DESCRIPTION: Draws a red circle centered at (362, 140) with radius 19.
; PLAN: r0=362(x), r1=140(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 140
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
