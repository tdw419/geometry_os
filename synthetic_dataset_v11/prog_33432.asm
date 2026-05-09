; DESCRIPTION: Draws a blue rectangle at (87, 69) with width 11 and height 65.
; PLAN: r0=87(x), r1=69(y), r2=11(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 69
LDI r2, 11
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
