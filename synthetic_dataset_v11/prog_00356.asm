; DESCRIPTION: Draws a cyan circle centered at (158, 198) with radius 39.
; PLAN: r0=158(x), r1=198(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 198
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
