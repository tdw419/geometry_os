; DESCRIPTION: Places a magenta circle of radius 54 at center (411, 144).
; PLAN: r0=411(x), r1=144(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 144
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
