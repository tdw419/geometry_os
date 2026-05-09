; DESCRIPTION: Places a magenta circle of radius 24 at center (404, 118).
; PLAN: r0=404(x), r1=118(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 118
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
