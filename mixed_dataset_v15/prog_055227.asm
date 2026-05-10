; DESCRIPTION: Creates a green circular shape at (404, 123) with radius 47.
; PLAN: r0=404(x), r1=123(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 123
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
