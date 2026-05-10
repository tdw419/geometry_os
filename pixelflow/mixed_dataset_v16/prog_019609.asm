; DESCRIPTION: Places a magenta circle of radius 25 at center (296, 94).
; PLAN: r0=296(x), r1=94(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 94
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
