; DESCRIPTION: Places a blue circle of radius 20 at center (429, 232).
; PLAN: r0=429(x), r1=232(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 232
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
