; DESCRIPTION: Creates a cyan circular shape at (432, 184) with radius 63.
; PLAN: r0=432(x), r1=184(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 184
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
