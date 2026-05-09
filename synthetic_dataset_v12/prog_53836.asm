; DESCRIPTION: Places a magenta circle of radius 50 at center (430, 105).
; PLAN: r0=430(x), r1=105(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 105
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
