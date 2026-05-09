; DESCRIPTION: Draws a blue rectangle at (37, 117) with width 68 and height 77.
; PLAN: r0=37(x), r1=117(y), r2=68(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 117
LDI r2, 68
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
