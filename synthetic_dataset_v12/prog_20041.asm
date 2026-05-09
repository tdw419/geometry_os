; DESCRIPTION: Draws a blue rectangle at (220, 149) with width 74 and height 79.
; PLAN: r0=220(x), r1=149(y), r2=74(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 149
LDI r2, 74
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
