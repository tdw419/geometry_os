; DESCRIPTION: Places a purple circle of radius 63 at center (220, 166).
; PLAN: r0=220(x), r1=166(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 166
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
