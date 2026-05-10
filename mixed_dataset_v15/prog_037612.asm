; DESCRIPTION: Draws a black rectangle at (156, 117) with width 91 and height 25.
; PLAN: r0=156(x), r1=117(y), r2=91(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 117
LDI r2, 91
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
