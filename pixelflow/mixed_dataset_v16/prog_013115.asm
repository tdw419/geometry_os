; DESCRIPTION: Draws a yellow rectangle at (261, 37) with width 91 and height 85.
; PLAN: r0=261(x), r1=37(y), r2=91(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 37
LDI r2, 91
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
