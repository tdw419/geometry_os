; DESCRIPTION: Places a magenta circle of radius 78 at center (195, 170).
; PLAN: r0=195(x), r1=170(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 170
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
