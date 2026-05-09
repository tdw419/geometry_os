; DESCRIPTION: Draws a blue rectangle at (255, 81) with width 79 and height 53.
; PLAN: r0=255(x), r1=81(y), r2=79(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 81
LDI r2, 79
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
