; DESCRIPTION: Draws a white rectangle at (127, 158) with width 36 and height 67.
; PLAN: r0=127(x), r1=158(y), r2=36(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 158
LDI r2, 36
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
