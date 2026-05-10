; DESCRIPTION: Draws a yellow rectangle at (370, 34) with width 97 and height 23.
; PLAN: r0=370(x), r1=34(y), r2=97(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 34
LDI r2, 97
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
