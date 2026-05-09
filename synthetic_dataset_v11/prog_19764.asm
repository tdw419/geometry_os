; DESCRIPTION: Places a magenta circle of radius 63 at center (125, 132).
; PLAN: r0=125(x), r1=132(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 132
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
