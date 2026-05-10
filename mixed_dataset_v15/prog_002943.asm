; DESCRIPTION: Draws a blue rectangle at (138, 178) with width 65 and height 15.
; PLAN: r0=138(x), r1=178(y), r2=65(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 178
LDI r2, 65
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
