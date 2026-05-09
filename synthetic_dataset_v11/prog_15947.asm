; DESCRIPTION: Draws a yellow rectangle at (59, 132) with width 97 and height 51.
; PLAN: r0=59(x), r1=132(y), r2=97(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 132
LDI r2, 97
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
