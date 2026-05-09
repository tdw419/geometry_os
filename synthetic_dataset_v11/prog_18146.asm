; DESCRIPTION: Draws a green rectangle at (25, 114) with width 107 and height 102.
; PLAN: r0=25(x), r1=114(y), r2=107(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 114
LDI r2, 107
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
