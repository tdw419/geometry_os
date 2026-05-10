; DESCRIPTION: Draws a black rectangle at (304, 97) with width 23 and height 90.
; PLAN: r0=304(x), r1=97(y), r2=23(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 97
LDI r2, 23
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
