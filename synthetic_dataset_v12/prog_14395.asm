; DESCRIPTION: Draws a cyan rectangle at (155, 72) with width 69 and height 97.
; PLAN: r0=155(x), r1=72(y), r2=69(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 72
LDI r2, 69
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
