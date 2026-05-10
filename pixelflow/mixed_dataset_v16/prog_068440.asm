; DESCRIPTION: Draws a blue rectangle at (236, 25) with width 60 and height 79.
; PLAN: r0=236(x), r1=25(y), r2=60(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 25
LDI r2, 60
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
