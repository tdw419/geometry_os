; DESCRIPTION: Creates a cyan circular shape at (68, 155) with radius 63.
; PLAN: r0=68(x), r1=155(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 155
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
