; DESCRIPTION: Places a blue circle of radius 63 at center (309, 90).
; PLAN: r0=309(x), r1=90(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 90
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
