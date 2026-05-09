; DESCRIPTION: Places a green circle of radius 21 at center (84, 86).
; PLAN: r0=84(x), r1=86(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 86
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
