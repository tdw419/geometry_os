; DESCRIPTION: Draws a red circle centered at (195, 111) with radius 52.
; PLAN: r0=195(x), r1=111(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 111
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
