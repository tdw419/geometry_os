; DESCRIPTION: Draws a black rectangle at (101, 13) with width 94 and height 91.
; PLAN: r0=101(x), r1=13(y), r2=94(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 13
LDI r2, 94
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
