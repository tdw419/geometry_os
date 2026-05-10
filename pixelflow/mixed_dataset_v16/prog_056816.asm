; DESCRIPTION: Draws a yellow rectangle at (54, 132) with width 109 and height 91.
; PLAN: r0=54(x), r1=132(y), r2=109(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 132
LDI r2, 109
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
