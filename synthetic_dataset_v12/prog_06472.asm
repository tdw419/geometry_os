; DESCRIPTION: Draws a cyan rectangle at (155, 114) with width 54 and height 16.
; PLAN: r0=155(x), r1=114(y), r2=54(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 114
LDI r2, 54
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
