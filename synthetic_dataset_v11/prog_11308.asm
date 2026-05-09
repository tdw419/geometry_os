; DESCRIPTION: Places a magenta circle of radius 64 at center (185, 159).
; PLAN: r0=185(x), r1=159(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 159
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
