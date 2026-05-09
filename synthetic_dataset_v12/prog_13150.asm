; DESCRIPTION: Draws a blue rectangle at (362, 141) with width 119 and height 47.
; PLAN: r0=362(x), r1=141(y), r2=119(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 141
LDI r2, 119
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
