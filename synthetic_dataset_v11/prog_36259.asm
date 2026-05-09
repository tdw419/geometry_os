; DESCRIPTION: Creates a green circular shape at (84, 176) with radius 16.
; PLAN: r0=84(x), r1=176(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 176
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
