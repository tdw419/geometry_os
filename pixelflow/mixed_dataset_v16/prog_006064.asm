; DESCRIPTION: Draws a blue rectangle at (170, 14) with width 12 and height 117.
; PLAN: r0=170(x), r1=14(y), r2=12(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 14
LDI r2, 12
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
