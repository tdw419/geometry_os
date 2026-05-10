; DESCRIPTION: Draws a blue rectangle at (73, 178) with width 120 and height 69.
; PLAN: r0=73(x), r1=178(y), r2=120(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 178
LDI r2, 120
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
