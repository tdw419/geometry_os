; DESCRIPTION: Creates a blue circular shape at (404, 78) with radius 75.
; PLAN: r0=404(x), r1=78(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 78
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
