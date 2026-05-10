; DESCRIPTION: Draws a blue rectangle at (107, 9) with width 14 and height 36.
; PLAN: r0=107(x), r1=9(y), r2=14(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 9
LDI r2, 14
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
