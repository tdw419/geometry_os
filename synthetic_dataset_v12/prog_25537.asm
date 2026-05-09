; DESCRIPTION: Draws a yellow rectangle at (326, 105) with width 31 and height 69.
; PLAN: r0=326(x), r1=105(y), r2=31(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 105
LDI r2, 31
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
