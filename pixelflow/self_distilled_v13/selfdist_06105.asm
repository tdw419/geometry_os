; DESCRIPTION: Draws a yellow rectangle at (129, 37) with width 97 and height 61.
; PLAN: r0=129(x), r1=37(y), r2=97(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 37
LDI r2, 97
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
