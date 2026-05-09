; DESCRIPTION: Draws a orange rectangle at (279, 119) with width 62 and height 38.
; PLAN: r0=279(x), r1=119(y), r2=62(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 119
LDI r2, 62
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
