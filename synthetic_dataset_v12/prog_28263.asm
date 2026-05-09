; DESCRIPTION: Draws a blue rectangle at (64, 79) with width 71 and height 50.
; PLAN: r0=64(x), r1=79(y), r2=71(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 79
LDI r2, 71
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
