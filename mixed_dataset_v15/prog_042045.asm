; DESCRIPTION: Draws a yellow rectangle at (93, 62) with width 108 and height 25.
; PLAN: r0=93(x), r1=62(y), r2=108(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 62
LDI r2, 108
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
