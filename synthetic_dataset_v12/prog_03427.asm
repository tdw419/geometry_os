; DESCRIPTION: Draws a blue rectangle at (350, 116) with width 70 and height 79.
; PLAN: r0=350(x), r1=116(y), r2=70(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 116
LDI r2, 70
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
