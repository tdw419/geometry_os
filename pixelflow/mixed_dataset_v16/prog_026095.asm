; DESCRIPTION: Places a magenta circle of radius 30 at center (404, 162).
; PLAN: r0=404(x), r1=162(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 162
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
