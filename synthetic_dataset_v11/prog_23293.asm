; DESCRIPTION: Draws a blue rectangle at (132, 59) with width 102 and height 113.
; PLAN: r0=132(x), r1=59(y), r2=102(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 59
LDI r2, 102
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
