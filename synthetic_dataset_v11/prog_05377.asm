; DESCRIPTION: Draws a blue rectangle at (54, 154) with width 15 and height 55.
; PLAN: r0=54(x), r1=154(y), r2=15(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 154
LDI r2, 15
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
