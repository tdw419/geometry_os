; DESCRIPTION: Creates a blue circular shape at (404, 173) with radius 44.
; PLAN: r0=404(x), r1=173(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 173
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
