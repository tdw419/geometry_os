; DESCRIPTION: Draws a cyan circle centered at (195, 198) with radius 38.
; PLAN: r0=195(x), r1=198(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 198
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
