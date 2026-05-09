; DESCRIPTION: Draws a yellow rectangle at (76, 34) with width 108 and height 30.
; PLAN: r0=76(x), r1=34(y), r2=108(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 34
LDI r2, 108
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
