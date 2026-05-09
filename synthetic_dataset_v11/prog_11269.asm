; DESCRIPTION: Places a magenta circle of radius 74 at center (144, 109).
; PLAN: r0=144(x), r1=109(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 109
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
