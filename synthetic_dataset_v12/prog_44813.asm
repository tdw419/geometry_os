; DESCRIPTION: Draws a blue rectangle at (213, 217) with width 22 and height 25.
; PLAN: r0=213(x), r1=217(y), r2=22(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 217
LDI r2, 22
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
