; DESCRIPTION: Draws a yellow rectangle at (25, 6) with width 113 and height 119.
; PLAN: r0=25(x), r1=6(y), r2=113(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 6
LDI r2, 113
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
