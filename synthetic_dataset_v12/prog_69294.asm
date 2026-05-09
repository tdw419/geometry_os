; DESCRIPTION: Draws a blue rectangle at (306, 66) with width 60 and height 74.
; PLAN: r0=306(x), r1=66(y), r2=60(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 66
LDI r2, 60
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
