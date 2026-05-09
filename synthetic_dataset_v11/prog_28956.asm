; DESCRIPTION: Places a magenta circle of radius 30 at center (49, 150).
; PLAN: r0=49(x), r1=150(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 150
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
