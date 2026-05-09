; DESCRIPTION: Draws a yellow rectangle at (19, 13) with width 94 and height 97.
; PLAN: r0=19(x), r1=13(y), r2=94(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 13
LDI r2, 94
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
