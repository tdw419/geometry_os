; DESCRIPTION: Places a blue circle of radius 11 at center (82, 224).
; PLAN: r0=82(x), r1=224(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 224
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
