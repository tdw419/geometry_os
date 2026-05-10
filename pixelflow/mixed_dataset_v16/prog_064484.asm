; DESCRIPTION: Draws a blue rectangle at (203, 127) with width 72 and height 66.
; PLAN: r0=203(x), r1=127(y), r2=72(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 127
LDI r2, 72
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
