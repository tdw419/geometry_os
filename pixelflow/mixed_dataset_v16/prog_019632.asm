; DESCRIPTION: Creates a blue circular shape at (404, 147) with radius 78.
; PLAN: r0=404(x), r1=147(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 147
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
