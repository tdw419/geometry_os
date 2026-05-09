; DESCRIPTION: Creates a yellow circular shape at (404, 90) with radius 20.
; PLAN: r0=404(x), r1=90(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 90
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
