; DESCRIPTION: Draws a blue rectangle at (116, 63) with width 85 and height 90.
; PLAN: r0=116(x), r1=63(y), r2=85(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 63
LDI r2, 85
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
