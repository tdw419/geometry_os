; DESCRIPTION: Draws a cyan circle centered at (63, 192) with radius 16.
; PLAN: r0=63(x), r1=192(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 192
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
