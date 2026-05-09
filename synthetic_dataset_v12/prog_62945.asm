; DESCRIPTION: Draws a cyan rectangle at (155, 101) with width 72 and height 79.
; PLAN: r0=155(x), r1=101(y), r2=72(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 101
LDI r2, 72
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
