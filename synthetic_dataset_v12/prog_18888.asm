; DESCRIPTION: Draws a green rectangle at (226, 122) with width 87 and height 68.
; PLAN: r0=226(x), r1=122(y), r2=87(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 122
LDI r2, 87
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
