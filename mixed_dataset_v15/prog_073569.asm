; DESCRIPTION: Draws a red circle centered at (220, 178) with radius 72.
; PLAN: r0=220(x), r1=178(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 178
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
