; DESCRIPTION: Creates a cyan circular shape at (426, 198) with radius 21.
; PLAN: r0=426(x), r1=198(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 198
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
