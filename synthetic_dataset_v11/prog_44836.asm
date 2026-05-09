; DESCRIPTION: Draws a blue rectangle at (130, 175) with width 85 and height 55.
; PLAN: r0=130(x), r1=175(y), r2=85(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 175
LDI r2, 85
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
