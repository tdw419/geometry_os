; DESCRIPTION: Draws a yellow rectangle at (76, 40) with width 31 and height 108.
; PLAN: r0=76(x), r1=40(y), r2=31(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 40
LDI r2, 31
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
