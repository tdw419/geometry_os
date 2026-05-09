; DESCRIPTION: Draws a blue rectangle at (107, 117) with width 14 and height 55.
; PLAN: r0=107(x), r1=117(y), r2=14(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 117
LDI r2, 14
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
