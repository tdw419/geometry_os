; DESCRIPTION: Draws a blue rectangle at (74, 155) with width 27 and height 25.
; PLAN: r0=74(x), r1=155(y), r2=27(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 155
LDI r2, 27
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
