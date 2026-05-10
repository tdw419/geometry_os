; DESCRIPTION: Draws a cyan circle centered at (84, 86) with radius 69.
; PLAN: r0=84(x), r1=86(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 86
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
