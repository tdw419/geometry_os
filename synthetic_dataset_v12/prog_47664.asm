; DESCRIPTION: Places a magenta circle of radius 43 at center (272, 125).
; PLAN: r0=272(x), r1=125(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 125
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
