; DESCRIPTION: Draws a green rectangle at (107, 117) with width 80 and height 68.
; PLAN: r0=107(x), r1=117(y), r2=80(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 117
LDI r2, 80
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
