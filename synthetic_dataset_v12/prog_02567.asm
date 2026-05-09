; DESCRIPTION: Draws a cyan circle centered at (366, 108) with radius 37.
; PLAN: r0=366(x), r1=108(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 108
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
