; DESCRIPTION: Draws a red circle centered at (111, 159) with radius 60.
; PLAN: r0=111(x), r1=159(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 159
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
