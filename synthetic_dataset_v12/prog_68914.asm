; DESCRIPTION: Draws a blue rectangle at (256, 133) with width 109 and height 79.
; PLAN: r0=256(x), r1=133(y), r2=109(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 133
LDI r2, 109
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
