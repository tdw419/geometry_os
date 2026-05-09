; DESCRIPTION: Draws a red circle centered at (188, 111) with radius 71.
; PLAN: r0=188(x), r1=111(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 111
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
