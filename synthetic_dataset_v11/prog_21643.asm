; DESCRIPTION: Draws a yellow rectangle at (105, 134) with width 27 and height 114.
; PLAN: r0=105(x), r1=134(y), r2=27(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 134
LDI r2, 27
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
