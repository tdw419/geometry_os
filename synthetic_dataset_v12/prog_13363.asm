; DESCRIPTION: Draws a green rectangle at (70, 198) with width 43 and height 58.
; PLAN: r0=70(x), r1=198(y), r2=43(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 198
LDI r2, 43
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
