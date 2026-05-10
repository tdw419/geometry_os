; DESCRIPTION: Draws a white rectangle at (84, 122) with width 28 and height 107.
; PLAN: r0=84(x), r1=122(y), r2=28(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 122
LDI r2, 28
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
