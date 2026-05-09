; DESCRIPTION: Draws a blue rectangle at (69, 55) with width 60 and height 63.
; PLAN: r0=69(x), r1=55(y), r2=60(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 55
LDI r2, 60
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
