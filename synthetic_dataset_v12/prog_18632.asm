; DESCRIPTION: Draws a blue rectangle at (164, 125) with width 79 and height 29.
; PLAN: r0=164(x), r1=125(y), r2=79(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 125
LDI r2, 79
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
