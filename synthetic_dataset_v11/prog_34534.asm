; DESCRIPTION: Draws a red rectangle at (175, 122) with width 40 and height 87.
; PLAN: r0=175(x), r1=122(y), r2=40(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 122
LDI r2, 40
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
