; DESCRIPTION: Draws a blue rectangle at (62, 58) with width 15 and height 50.
; PLAN: r0=62(x), r1=58(y), r2=15(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 58
LDI r2, 15
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
