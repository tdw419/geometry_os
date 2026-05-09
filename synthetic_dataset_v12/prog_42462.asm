; DESCRIPTION: Draws a black rectangle at (86, 95) with width 97 and height 117.
; PLAN: r0=86(x), r1=95(y), r2=97(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 95
LDI r2, 97
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
