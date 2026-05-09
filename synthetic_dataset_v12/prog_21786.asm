; DESCRIPTION: Draws a blue rectangle at (127, 7) with width 114 and height 71.
; PLAN: r0=127(x), r1=7(y), r2=114(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 7
LDI r2, 114
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
