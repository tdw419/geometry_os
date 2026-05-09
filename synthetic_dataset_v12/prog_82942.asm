; DESCRIPTION: Draws a green rectangle at (296, 115) with width 68 and height 36.
; PLAN: r0=296(x), r1=115(y), r2=68(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 115
LDI r2, 68
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
