; DESCRIPTION: Places a magenta circle of radius 15 at center (309, 50).
; PLAN: r0=309(x), r1=50(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 50
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
