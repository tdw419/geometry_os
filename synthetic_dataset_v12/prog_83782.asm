; DESCRIPTION: Draws a cyan circle centered at (134, 108) with radius 16.
; PLAN: r0=134(x), r1=108(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 108
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
