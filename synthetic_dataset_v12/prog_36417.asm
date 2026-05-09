; DESCRIPTION: Places a magenta circle of radius 40 at center (463, 144).
; PLAN: r0=463(x), r1=144(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 144
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
