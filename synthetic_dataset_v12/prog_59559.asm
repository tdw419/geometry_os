; DESCRIPTION: Draws a blue rectangle at (94, 42) with width 15 and height 84.
; PLAN: r0=94(x), r1=42(y), r2=15(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 42
LDI r2, 15
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
