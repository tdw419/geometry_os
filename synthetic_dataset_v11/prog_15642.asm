; DESCRIPTION: Draws a blue rectangle at (145, 79) with width 30 and height 57.
; PLAN: r0=145(x), r1=79(y), r2=30(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 79
LDI r2, 30
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
