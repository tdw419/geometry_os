; DESCRIPTION: Draws a white rectangle at (94, 118) with width 108 and height 113.
; PLAN: r0=94(x), r1=118(y), r2=108(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 118
LDI r2, 108
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
