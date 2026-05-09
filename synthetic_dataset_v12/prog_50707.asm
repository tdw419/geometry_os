; DESCRIPTION: Places a magenta circle of radius 50 at center (144, 94).
; PLAN: r0=144(x), r1=94(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 94
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
