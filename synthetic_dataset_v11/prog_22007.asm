; DESCRIPTION: Draws a red circle centered at (140, 171) with radius 19.
; PLAN: r0=140(x), r1=171(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 171
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
