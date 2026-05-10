; DESCRIPTION: Places a blue circle of radius 37 at center (267, 63).
; PLAN: r0=267(x), r1=63(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 63
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
