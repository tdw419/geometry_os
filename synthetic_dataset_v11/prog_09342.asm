; DESCRIPTION: Draws a black rectangle at (13, 32) with width 25 and height 54.
; PLAN: r0=13(x), r1=32(y), r2=25(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 32
LDI r2, 25
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
