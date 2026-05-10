; DESCRIPTION: Draws a blue rectangle at (69, 69) with width 38 and height 16.
; PLAN: r0=69(x), r1=69(y), r2=38(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 69
LDI r2, 38
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
