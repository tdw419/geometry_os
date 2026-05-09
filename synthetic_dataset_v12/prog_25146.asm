; DESCRIPTION: Creates a cyan circular shape at (65, 63) with radius 53.
; PLAN: r0=65(x), r1=63(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 63
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
