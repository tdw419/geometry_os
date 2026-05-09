; DESCRIPTION: Draws a yellow rectangle at (319, 114) with width 116 and height 97.
; PLAN: r0=319(x), r1=114(y), r2=116(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 114
LDI r2, 116
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
