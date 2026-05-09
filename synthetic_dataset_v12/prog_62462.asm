; DESCRIPTION: Draws a white rectangle at (37, 97) with width 58 and height 118.
; PLAN: r0=37(x), r1=97(y), r2=58(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 97
LDI r2, 58
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
