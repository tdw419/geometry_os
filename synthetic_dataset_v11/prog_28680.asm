; DESCRIPTION: Places a magenta circle of radius 43 at center (162, 94).
; PLAN: r0=162(x), r1=94(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 94
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
