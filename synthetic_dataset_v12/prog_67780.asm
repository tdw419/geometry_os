; DESCRIPTION: Places a purple circle of radius 42 at center (396, 63).
; PLAN: r0=396(x), r1=63(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 63
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
