; DESCRIPTION: Draws a red circle centered at (373, 134) with radius 50.
; PLAN: r0=373(x), r1=134(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 134
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
