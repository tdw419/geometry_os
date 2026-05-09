; DESCRIPTION: Draws a red circle centered at (230, 109) with radius 63.
; PLAN: r0=230(x), r1=109(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 109
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
