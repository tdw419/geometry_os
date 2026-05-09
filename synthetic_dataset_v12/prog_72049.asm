; DESCRIPTION: Places a magenta circle of radius 36 at center (318, 185).
; PLAN: r0=318(x), r1=185(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 185
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
