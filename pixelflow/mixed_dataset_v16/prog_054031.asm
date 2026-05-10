; DESCRIPTION: Draws a blue rectangle at (68, 18) with width 109 and height 97.
; PLAN: r0=68(x), r1=18(y), r2=109(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 18
LDI r2, 109
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
