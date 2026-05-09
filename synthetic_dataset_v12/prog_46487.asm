; DESCRIPTION: Places a magenta circle of radius 10 at center (358, 156).
; PLAN: r0=358(x), r1=156(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 156
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
