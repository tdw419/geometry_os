; DESCRIPTION: Places a blue disk with center (396, 156) and radius 42.
; PLAN: r0=396(x), r1=156(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 156
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
