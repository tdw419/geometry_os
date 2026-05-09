; DESCRIPTION: Places a green circle of radius 19 at center (128, 218).
; PLAN: r0=128(x), r1=218(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 218
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
