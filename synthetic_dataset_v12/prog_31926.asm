; DESCRIPTION: Draws a green rectangle at (84, 80) with width 68 and height 58.
; PLAN: r0=84(x), r1=80(y), r2=68(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 80
LDI r2, 68
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
