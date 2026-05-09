; DESCRIPTION: Draws a green rectangle at (58, 126) with width 84 and height 37.
; PLAN: r0=58(x), r1=126(y), r2=84(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 126
LDI r2, 84
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
