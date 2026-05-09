; DESCRIPTION: Draws a yellow rectangle at (287, 86) with width 68 and height 91.
; PLAN: r0=287(x), r1=86(y), r2=68(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 86
LDI r2, 68
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
