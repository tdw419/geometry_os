; DESCRIPTION: Draws a red circle centered at (172, 204) with radius 25.
; PLAN: r0=172(x), r1=204(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 204
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
