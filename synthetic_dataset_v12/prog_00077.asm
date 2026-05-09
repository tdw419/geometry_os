; DESCRIPTION: Draws a blue rectangle at (153, 122) with width 109 and height 26.
; PLAN: r0=153(x), r1=122(y), r2=109(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 122
LDI r2, 109
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
