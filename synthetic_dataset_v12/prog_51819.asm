; DESCRIPTION: Draws a yellow rectangle at (359, 160) with width 74 and height 62.
; PLAN: r0=359(x), r1=160(y), r2=74(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 160
LDI r2, 74
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
