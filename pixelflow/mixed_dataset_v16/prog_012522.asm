; DESCRIPTION: Places a magenta circle of radius 31 at center (363, 125).
; PLAN: r0=363(x), r1=125(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 125
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
