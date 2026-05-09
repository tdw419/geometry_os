; DESCRIPTION: Draws a yellow rectangle at (66, 26) with width 38 and height 108.
; PLAN: r0=66(x), r1=26(y), r2=38(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 26
LDI r2, 38
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
