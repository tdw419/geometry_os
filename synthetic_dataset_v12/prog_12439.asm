; DESCRIPTION: Places a magenta circle of radius 79 at center (270, 125).
; PLAN: r0=270(x), r1=125(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 125
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
