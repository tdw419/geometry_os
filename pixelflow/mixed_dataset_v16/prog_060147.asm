; DESCRIPTION: Draws a cyan circle centered at (423, 122) with radius 35.
; PLAN: r0=423(x), r1=122(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 122
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
