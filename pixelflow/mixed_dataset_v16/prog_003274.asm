; DESCRIPTION: Draws a purple circle centered at (404, 164) with radius 75.
; PLAN: r0=404(x), r1=164(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 164
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
