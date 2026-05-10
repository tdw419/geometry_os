; DESCRIPTION: Places a blue circle of radius 50 at center (404, 141).
; PLAN: r0=404(x), r1=141(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 141
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
