; DESCRIPTION: Draws a black rectangle at (7, 99) with width 26 and height 94.
; PLAN: r0=7(x), r1=99(y), r2=26(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 99
LDI r2, 26
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
