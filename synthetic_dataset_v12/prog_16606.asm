; DESCRIPTION: Places a magenta circle of radius 53 at center (147, 68).
; PLAN: r0=147(x), r1=68(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 68
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
