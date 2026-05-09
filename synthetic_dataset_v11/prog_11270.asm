; DESCRIPTION: Creates a cyan circular shape at (136, 198) with radius 56.
; PLAN: r0=136(x), r1=198(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 198
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
