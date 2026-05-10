; DESCRIPTION: Draws a blue rectangle at (193, 176) with width 116 and height 79.
; PLAN: r0=193(x), r1=176(y), r2=116(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 176
LDI r2, 116
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
