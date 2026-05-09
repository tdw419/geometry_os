; DESCRIPTION: Places a blue circle of radius 37 at center (160, 128).
; PLAN: r0=160(x), r1=128(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 128
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
