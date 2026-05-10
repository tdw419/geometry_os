; DESCRIPTION: Draws a blue rectangle at (376, 9) with width 118 and height 34.
; PLAN: r0=376(x), r1=9(y), r2=118(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 9
LDI r2, 118
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
