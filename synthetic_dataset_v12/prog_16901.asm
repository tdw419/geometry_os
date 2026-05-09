; DESCRIPTION: Places a magenta circle of radius 13 at center (113, 94).
; PLAN: r0=113(x), r1=94(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 94
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
