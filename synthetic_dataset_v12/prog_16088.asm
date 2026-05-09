; DESCRIPTION: Draws a green rectangle at (170, 132) with width 108 and height 72.
; PLAN: r0=170(x), r1=132(y), r2=108(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 132
LDI r2, 108
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
