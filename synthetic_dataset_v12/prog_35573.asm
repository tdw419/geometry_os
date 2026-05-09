; DESCRIPTION: Places a blue circle of radius 20 at center (267, 203).
; PLAN: r0=267(x), r1=203(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 203
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
