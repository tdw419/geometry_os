; DESCRIPTION: Draws a blue rectangle at (180, 87) with width 15 and height 21.
; PLAN: r0=180(x), r1=87(y), r2=15(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 87
LDI r2, 15
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
