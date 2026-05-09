; DESCRIPTION: Places a blue circle of radius 13 at center (126, 21).
; PLAN: r0=126(x), r1=21(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 21
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
