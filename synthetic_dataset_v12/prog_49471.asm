; DESCRIPTION: Draws a yellow rectangle at (267, 132) with width 114 and height 77.
; PLAN: r0=267(x), r1=132(y), r2=114(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 132
LDI r2, 114
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
