; DESCRIPTION: Draws a blue rectangle at (127, 178) with width 120 and height 19.
; PLAN: r0=127(x), r1=178(y), r2=120(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 178
LDI r2, 120
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
