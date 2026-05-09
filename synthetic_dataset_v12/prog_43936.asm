; DESCRIPTION: Draws a orange rectangle at (67, 163) with width 98 and height 91.
; PLAN: r0=67(x), r1=163(y), r2=98(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 163
LDI r2, 98
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
