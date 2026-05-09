; DESCRIPTION: Draws a yellow rectangle at (3, 66) with width 91 and height 67.
; PLAN: r0=3(x), r1=66(y), r2=91(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 66
LDI r2, 91
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
