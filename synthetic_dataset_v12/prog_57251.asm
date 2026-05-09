; DESCRIPTION: Draws a red rectangle at (280, 91) with width 114 and height 105.
; PLAN: r0=280(x), r1=91(y), r2=114(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 91
LDI r2, 114
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
